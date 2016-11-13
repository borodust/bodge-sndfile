(in-package :bodge-sndfile)


(defmacro %catch-sound-errors ((snd-file) &body body)
  (once-only (snd-file)
    `(prog1
         (progn
           ,@body)
       (when (/= (%sndfile:error ,snd-file) %sndfile:+err-no-error+)
         (error (%sndfile:strerror ,snd-file))))))


(defmacro with-sound-info ((var) &body body)
  `(c-with ((,var %sndfile:info))
     ,@body))


(defstruct (sound-file
             (:conc-name sound-)
             (:constructor %make-sound-file (handle sample-rate channels frames)))
  (handle nil :read-only t)
  (sample-rate 0 :type fixnum :read-only t)
  (channels 0 :type fixnum :read-only t)
  (frames 0 :type fixnum :read-only t))


(defmacro with-open-sound-file ((file path) &body body)
  (with-gensyms (sound-info file-handle)
    `(with-sound-info (,sound-info)
       (setf (,sound-info :format) 0)
       (let* ((,file-handle (%sndfile:open (namestring ,path)
                                           %sndfile:+m-read+ ,sound-info))
              (,file (%make-sound-file ,file-handle
                                       (,sound-info :samplerate)
                                       (,sound-info :channels)
                                       (,sound-info :frames))))
         (unwind-protect
              (%catch-sound-errors (,file-handle)
                ,@body)
           (%sndfile:close ,file-handle))))))


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
