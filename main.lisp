(in-package :sndfile)


(declaim (special *virtual-file*))


(defmacro %catch-sound-errors ((&optional snd-file) &body body)
  (let ((handle (or snd-file '(cffi:null-pointer))))
    (once-only (handle)
      `(prog1 (progn ,@body)
         (when (/= (%sndfile:error ,handle) %sndfile:+err-no-error+)
           (error "SNDFILE ERROR: ~A" (%sndfile:strerror ,handle)))))))


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
       (let* ((,handle (%catch-sound-errors () (funcall ,handle-ctor ,sound-info)))
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
    (static-vectors:with-static-vector (buf buf-length :element-type '(signed-byte 16))
      (loop for samples-read = (%sndfile:read-short (sound-handle file)
                                                    (static-vectors:static-vector-pointer buf)
                                                    samples-per-read)
         until (= samples-read 0)
         for written = 0 then (+ written samples-read) do
           (loop for i from 0 below samples-read
                 do (setf (aref result (+ i written)) (aref buf i)))))
    result))


;;;
;;; Stream input/output
;;;

(defstruct (virtual-file
             (:constructor %make-virtual-file))
  (data (static-vectors:make-static-vector 0) :type (simple-array (unsigned-byte 8) (*)))
  (max-position 0 :type fixnum)
  (position 0 :type fixnum))


(defun virtual-file-length (virtual-file)
  (length (virtual-file-data virtual-file)))


(defun enlarge-virtual-file (virtual-file required-size)
  (let* ((new-size (ceiling (1+ (* (max required-size (virtual-file-length virtual-file)) 1.5))))
         (new-data (static-vectors:make-static-vector new-size
                                                      :element-type '(unsigned-byte 8)))
         (old-data (virtual-file-data virtual-file)))
    (static-vectors:replace-foreign-memory (static-vectors:static-vector-pointer new-data)
                                           (static-vectors:static-vector-pointer old-data)
                                           (virtual-file-length virtual-file))
    (static-vectors:free-static-vector old-data)
    (setf (virtual-file-data virtual-file) new-data)))


(defun make-virtual-file-from-stream (stream)
  (let* ((byte-array (alexandria:read-stream-content-into-byte-vector stream))
         (static-byte-array (static-vectors:make-static-vector (length byte-array)
                                                               :initial-contents byte-array)))
    (%make-virtual-file :data static-byte-array)))


(defun make-virtual-file (&key (initial-size 0))
  (%make-virtual-file :data (static-vectors:make-static-vector initial-size)))


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


(defun update-max-position ()
  (when (> (virtual-file-position *virtual-file*)
             (virtual-file-max-position *virtual-file*))
    (setf (virtual-file-max-position *virtual-file*) (virtual-file-position *virtual-file*))))


(defun replace-foreign-memory (src dst count)
  (let ((length (min-count count)))
    (static-vectors:replace-foreign-memory dst src length)
    (incf (virtual-file-position *virtual-file*) length)
    (update-max-position)
    length))


(defun static-vector-pointer ()
  (static-vectors:static-vector-pointer (virtual-file-data *virtual-file*)
                                        :offset (virtual-file-position *virtual-file*)))


(defcallback vio-read %sndfile:count-t ((ptr :pointer) (count %sndfile:count-t) (user-data :pointer))
  (declare (ignore user-data))
  (replace-foreign-memory (static-vector-pointer) ptr count))


(defcallback vio-write %sndfile:count-t ((ptr :pointer) (count %sndfile:count-t) (user-data :pointer))
  (declare (ignore user-data))
  (let ((required-size (+ (virtual-file-position *virtual-file*) count)))
    (when (> required-size
             (virtual-file-length *virtual-file*))
      (enlarge-virtual-file *virtual-file* required-size)))
  (replace-foreign-memory ptr (static-vector-pointer) count)
  count)


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


(defmacro with-virtual-io ((vio) &body body)
  `(let ((,vio (make-virtual-io)))
     (unwind-protect
          (progn ,@body)
       (free ,vio))))


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


(defun write-short-samples-into-stream (stream samples &key (format :flac)
                                                         (channels 2)
                                                         (sample-rate 48000))
  (let ((sndfile-format (ecase format
                          (:flac (logior %sndfile:+format-pcm-16+ %sndfile:+format-flac+))
                          #++(:ogg (logior %sndfile:+format-ogg+ %sndfile:+format-vorbis+))
                          (:wav (logior %sndfile:+format-pcm-16+ %sndfile:+format-wav+)))))
    (c-with ((info %sndfile:info :calloc t))
      (setf (info :format) sndfile-format
            (info :channels) channels
            (info :samplerate) sample-rate)
      (when (= 0 (%sndfile:format-check info))
        (error "Invalid format"))
      (let* ((*virtual-file* (make-virtual-file :initial-size (length samples))))
        (with-virtual-io (vio)
          (let ((sndfile (%catch-sound-errors ()
                           (%sndfile:open-virtual vio
                                                  %sndfile:+m-write+
                                                  info
                                                  (cffi-sys:null-pointer)))))
            (static-vectors:with-static-vector (buf (length samples)
                                                    :element-type '(signed-byte 16)
                                                    :initial-contents samples)
              (%catch-sound-errors (sndfile)
                (%sndfile:write-short sndfile
                                      (static-vectors:static-vector-pointer buf)
                                      (length buf)))
              (%sndfile:close sndfile)
              (let ((size (virtual-file-max-position *virtual-file*)))
                (write-sequence (virtual-file-data *virtual-file*) stream :end size)
                size))))))))
