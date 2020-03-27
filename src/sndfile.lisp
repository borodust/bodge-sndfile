(cl:in-package :sndfile)


(declaim (special *virtual-file*))


(defmacro %catch-sound-errors ((&optional snd-file) &body body)
  (let ((handle (or snd-file '(cffi:null-pointer))))
    (once-only (handle)
      `(prog1 (progn ,@body)
         (when (/= (%sndfile:error ,handle) %sndfile:+err-no-error+)
           (error "SNDFILE ERROR: ~A" (cffi:foreign-string-to-lisp
                                       (%sndfile:strerror ,handle))))))))


(defmacro with-sound-info ((var) &body body)
  `(c-with ((,var %sndfile:info :clear t))
     ,@body))


(defun parse-format (encoded-format)
  (flet ((%bitcmp-major (reference value)
           (= (logand reference %sndfile:+format-typemask+) value))
         (%bitcmp-minor (reference value)
           (= (logand reference %sndfile:+format-submask+) value))
         (%bitcmp-endian (reference value)
           (= (logand reference %sndfile:+format-endmask+) value)))
    (list* (alexandria:switch (encoded-format :test #'%bitcmp-major)
             (%sndfile:+format-wav+ :wav)
             (%sndfile:+format-aiff+ :aiff)
             (%sndfile:+format-au+ :au)
             (%sndfile:+format-raw+ :raw)
             (%sndfile:+format-paf+ :paf)
             (%sndfile:+format-svx+ :svx)
             (%sndfile:+format-nist+ :nist)
             (%sndfile:+format-voc+ :voc)
             (%sndfile:+format-ircam+ :ircam)
             (%sndfile:+format-w64+ :w64)
             (%sndfile:+format-mat4+ :mat4)
             (%sndfile:+format-mat5+ :mat5)
             (%sndfile:+format-pvf+ :pvf)
             (%sndfile:+format-xi+ :xi)
             (%sndfile:+format-htk+ :htk)
             (%sndfile:+format-sds+ :sds)
             (%sndfile:+format-avr+ :avr)
             (%sndfile:+format-wavex+ :wavex)
             (%sndfile:+format-sd2+ :sd2)
             (%sndfile:+format-flac+ :flac)
             (%sndfile:+format-caf+ :caf)
             (%sndfile:+format-wve+ :wve)
             (%sndfile:+format-ogg+ :ogg)
             (%sndfile:+format-mpc2k+ :mpc2k)
             (%sndfile:+format-rf64+ :rf64))

           (alexandria:switch (encoded-format :test #'%bitcmp-minor)
             (%sndfile:+format-pcm-s8+ :pcm-s8)
             (%sndfile:+format-pcm-16+ :pcm-16)
             (%sndfile:+format-pcm-24+ :pcm-24)
             (%sndfile:+format-pcm-32+ :pcm-32)
             (%sndfile:+format-pcm-u8+ :pcm-u8)
             (%sndfile:+format-float+ :float)
             (%sndfile:+format-double+ :double)
             (%sndfile:+format-ulaw+ :ulaw)
             (%sndfile:+format-alaw+ :alaw)
             (%sndfile:+format-ima-adpcm+ :ima-adpcm)
             (%sndfile:+format-ms-adpcm+ :ms-adpcm)
             (%sndfile:+format-gsm610+ :gsm610)
             (%sndfile:+format-vox-adpcm+ :vox-adpcm)
             (%sndfile:+format-nms-adpcm-16+ :nms-adpcm-16)
             (%sndfile:+format-nms-adpcm-24+ :nms-adpcm-24)
             (%sndfile:+format-nms-adpcm-32+ :nms-adpcm-32)
             (%sndfile:+format-g721-32+ :g721-32)
             (%sndfile:+format-g723-24+ :g723-24)
             (%sndfile:+format-g723-40+ :g723-40)
             (%sndfile:+format-dwvw-12+ :dwvw-12)
             (%sndfile:+format-dwvw-16+ :dwvw-16)
             (%sndfile:+format-dwvw-24+ :dwvw-24)
             (%sndfile:+format-dwvw-n+ :dwvw-n)
             (%sndfile:+format-dpcm-8+ :dpcm-8)
             (%sndfile:+format-dpcm-16+ :dpcm-16)
             (%sndfile:+format-vorbis+ :vorbis)
             (%sndfile:+format-opus+ :opus)
             (%sndfile:+format-alac-16+ :alac-16)
             (%sndfile:+format-alac-20+ :alac-20)
             (%sndfile:+format-alac-24+ :alac-24)
             (%sndfile:+format-alac-32+ :alac-32))

           (alexandria:when-let ((endianness (alexandria:switch
                                                 (encoded-format :test #'%bitcmp-endian)
                                               (%sndfile:+endian-file+ :file)
                                               (%sndfile:+endian-little+ :little)
                                               (%sndfile:+endian-big+ :big)
                                               (%sndfile:+endian-cpu+ :cpu))))
             (list endianness)))))


(defstruct (sound-file
            (:conc-name sound-)
            (:constructor %make-sound-file (handle sample-rate channels frames format)))
  (handle nil :read-only t)
  (sample-rate 0 :type fixnum :read-only t)
  (channels 0 :type fixnum :read-only t)
  (frames 0 :type fixnum :read-only t)
  (format nil :type list :read-only t))


(defmacro with-sound-file-handle ((file handle-ctor) &body body)
  (with-gensyms (sound-info handle)
    `(with-sound-info (,sound-info)
       (let* ((,handle (%catch-sound-errors () (funcall ,handle-ctor ,sound-info)))
              (,file (%make-sound-file ,handle
                                       (,sound-info :samplerate)
                                       (,sound-info :channels)
                                       (,sound-info :frames)
                                       (parse-format (,sound-info :format)))))
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


(cffi:defcallback vio-get-file-length %sndfile:count-t ((user-data :pointer))
  (declare (ignore user-data))
  (virtual-file-length *virtual-file*))


(cffi:defcallback vio-seek %sndfile:count-t ((offset %sndfile:count-t)
                                             (whence :int)
                                             (user-data :pointer))
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
    (%libc.es:memcpy dst src length)
    (incf (virtual-file-position *virtual-file*) length)
    (update-max-position)
    length))


(defun static-vector-pointer ()
  (static-vectors:static-vector-pointer (virtual-file-data *virtual-file*)
                                        :offset (virtual-file-position *virtual-file*)))


(cffi:defcallback vio-read %sndfile:count-t ((ptr :pointer)
                                             (count %sndfile:count-t)
                                             (user-data :pointer))
  (declare (ignore user-data))
  (replace-foreign-memory (static-vector-pointer) ptr count))


(cffi:defcallback vio-write %sndfile:count-t ((ptr :pointer)
                                              (count %sndfile:count-t)
                                              (user-data :pointer))
  (declare (ignore user-data))
  (let ((required-size (+ (virtual-file-position *virtual-file*) count)))
    (when (> required-size
             (virtual-file-length *virtual-file*))
      (enlarge-virtual-file *virtual-file* required-size)))
  (replace-foreign-memory ptr (static-vector-pointer) count)
  count)


(cffi:defcallback vio-tell %sndfile:count-t ((user-data :pointer))
  (declare (ignore user-data))
  (virtual-file-position *virtual-file*))


(defun make-virtual-io ()
  (c-let ((vio %sndfile:virtual-io :alloc t :clear t))
    (setf (vio :get-filelen) (cffi:callback vio-get-file-length)
          (vio :seek) (cffi:callback vio-seek)
          (vio :read) (cffi:callback vio-read)
          (vio :write) (cffi:callback vio-write)
          (vio :tell) (cffi:callback vio-tell))
    vio))


(defmacro with-virtual-io ((vio) &body body)
  `(let ((,vio (make-virtual-io)))
     (unwind-protect
          (progn ,@body)
       (cffi:foreign-free ,vio))))


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
         (cffi:foreign-free ,virtual-io)))))


(defun write-short-samples-into-stream (stream samples &key (format :flac)
                                                         (channels 2)
                                                         (sample-rate 48000))
  (let ((sndfile-format (ecase format
                          (:flac (logior %sndfile:+format-pcm-16+ %sndfile:+format-flac+))
                          (:ogg (logior %sndfile:+format-ogg+ %sndfile:+format-vorbis+))
                          (:wav (logior %sndfile:+format-pcm-16+ %sndfile:+format-wav+)))))
    (c-with ((info %sndfile:info :clear t))
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
