(in-package :bodge-sndfile)


(declaim (special *virtual-file*))


(defmacro %catch-sound-errors ((snd-file) &body body)
  (once-only (snd-file)
    `(prog1
         (progn
           ,@body)
       (when (/= (%sndfile:error ,snd-file) %sndfile:+err-no-error+)
         (error (%sndfile:strerror ,snd-file))))))


(defmacro with-sound-info ((var) &body body)
  `(c-with ((,var %sndfile:info :calloc t))
     ,@body))


(defstruct (sound-file
             (:conc-name sound-)
             (:constructor %make-sound-file (handle sample-rate channels frames)))
  (handle nil :read-only t)
  (sample-rate 0 :type fixnum :read-only t)
  (channels 0 :type fixnum :read-only t)
  (frames 0 :type fixnum :read-only t))


(defmacro with-sound-file-handle ((file handle-ctor) &body body)
  (with-gensyms (sound-info handle)
    `(with-sound-info (,sound-info)
       (let* ((,handle (funcall ,handle-ctor ,sound-info))
              (,file (%make-sound-file ,handle
                                       (,sound-info :samplerate)
                                       (,sound-info :channels)
                                       (,sound-info :frames))))
         (unwind-protect
              (%catch-sound-errors (,handle)
                ,@body)
           (%sndfile:close ,handle))))))


(defmacro with-open-sound-file ((file path) &body body)
  (with-gensyms (open-file)
    `(flet ((,open-file (sound-info)
              (%sndfile:open (namestring ,path) %sndfile:+m-read+ sound-info)))
       (with-sound-file-handle (,file #',open-file)
         ,@body))))


(defun read-short-samples-into-array (file)
  (let* ((result (make-array (* (sound-channels file) (sound-frames file))
                             :element-type '(signed-byte 16)))
         (frames-per-read (* 32 1024))
         (samples-per-read (* frames-per-read (sound-channels file)))
         (buf-length samples-per-read))
    (with-alloc (buf :short buf-length)
      (loop for samples-read = (%sndfile:read-short (sound-handle file)
                                                       buf samples-per-read)
         until (= samples-read 0)
         for written = 0 then (+ written samples-read) do
           (loop for i from 0 below samples-read do
                (setf (aref result (+ i written)) (c-aref buf i :short)))))
    result))


;;;
;;; Stream input/output
;;;

(defstruct virtual-file
  (data (static-vectors:make-static-vector 0) :type (simple-array (unsigned-byte 8) (*)) :read-only t)
  (position 0 :type fixnum))


(defun virtual-file-length (virtual-file)
  (length (virtual-file-data virtual-file)))


(defun make-virtual-file-from-stream (stream)
  (let* ((byte-array (alexandria:read-stream-content-into-byte-vector stream))
         (static-byte-array (static-vectors:make-static-vector (length byte-array)
                                                               :initial-contents byte-array)))
    (make-virtual-file :data static-byte-array)))


(defcallback vio-get-file-length %sndfile:count-t ((user-data :pointer))
  (declare (ignore user-data))
  (virtual-file-length *virtual-file*))


(defcallback vio-seek %sndfile:count-t ((offset %sndfile:count-t) (whence :int) (user-data :pointer))
  (declare (ignore user-data))
  (eswitch (whence)
    (%sndfile:+seek-cur+ (incf (virtual-file-position *virtual-file*) offset))
    (%sndfile:+seek-set+ (setf (virtual-file-position *virtual-file*) offset))
    (%sndfile:+seek-end+ (setf (virtual-file-position *virtual-file*)
                               (- (virtual-file-length offset))))))


(defun min-count (count)
  (min count (- (virtual-file-length *virtual-file*)
                (virtual-file-position *virtual-file*))))


(defun replace-foreign-memory (src dst count)
  (let ((length (min-count count)))
    (static-vectors:replace-foreign-memory dst src length)
    (incf (virtual-file-position *virtual-file*) length)
    length))

(defun static-vector-pointer ()
  (static-vectors:static-vector-pointer
   (virtual-file-data *virtual-file*)
   :offset (virtual-file-position *virtual-file*)))


(defcallback vio-read %sndfile:count-t ((ptr :pointer) (count %sndfile:count-t) (user-data :pointer))
  (declare (ignore user-data))
  (replace-foreign-memory (static-vector-pointer) ptr count))


(defcallback vio-write %sndfile:count-t ((ptr :pointer) (count %sndfile:count-t) (user-data :pointer))
  (declare (ignore user-data))
  (replace-foreign-memory ptr (static-vector-pointer) count))


(defcallback vio-tell %sndfile:count-t ((user-data :pointer))
  (declare (ignore user-data))
  (virtual-file-position *virtual-file*))


(defun make-virtual-io ()
  (c-let ((vio %sndfile:virtual-io :calloc t))
    (setf (vio :get-filelen) (callback 'vio-get-file-length)
          (vio :seek) (callback 'vio-seek)
          (vio :read) (callback 'vio-read)
          (vio :write) (callback 'vio-write)
          (vio :tell) (callback 'vio-tell))
    vio))


(defmacro with-sound-file-from-stream ((file stream) &body body)
  (with-gensyms (virtual-io open-file)
    `(let* ((*virtual-file* (make-virtual-file-from-stream ,stream))
            (,virtual-io (make-virtual-io)))
       (unwind-protect
            (flet ((,open-file (sound-info)
                     (%sndfile:open-virtual ,virtual-io
                                            %sndfile:+m-read+
                                            sound-info
                                            (cffi-sys:null-pointer))))
              (with-sound-file-handle (,file #',open-file)
                ,@body))
         (free ,virtual-io)))))
