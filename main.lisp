(in-package :bodge-sndfile)


(defmacro %catch-sound-errors ((snd-file) &body body)
  (once-only (snd-file)
    `(prog1
         (progn
           ,@body)
       (when (/= (%sndfile:sf-error ,snd-file) %sndfile:+sf-err-no-error+)
         (error (%sndfile:sf-strerror ,snd-file))))))


(defmacro with-sound-info ((var) &body body)
  `(c-with ((,var %sndfile:sf-info))
     ,@body))


(defstruct (sound-file
             (:conc-name sound-)
             (:constructor %make-sound-file (handle sample-rate channels)))
  (handle nil :read-only t)
  (sample-rate nil :read-only t)
  (channels nil :read-only t))


(defmacro with-open-sound-file ((file path) &body body)
  (with-gensyms (sound-info file-handle)
    `(with-sound-info (,sound-info)
       (setf (,sound-info :format) 0)
       (let* ((,file-handle (%sndfile:sf-open ,path %sndfile:+sfm-read+ ,sound-info))
              (,file (%make-sound-file ,file-handle
                                       (,sound-info :samplerate)
                                       (,sound-info :channels))))
         (declare (dynamic-extent ,file))
         (unwind-protect
              (%catch-sound-errors (,file-handle)
                ,@body)
           (%sndfile:sf-close ,file-handle))))))
