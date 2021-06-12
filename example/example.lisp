(cl:defpackage :sndfile.example
  (:use :cl :cffi-c-ref)
  (:export run
           decode))
(cl:in-package :sndfile.example)

;; original: https://freesound.org/people/waveplay/sounds/213725/
(defparameter *sample-file* (namestring
                             (asdf:system-relative-pathname :bodge-sndfile/example
                                                            "example/sample.ogg")))


(defun run ()
  "Native example reading metadata with thin API"
  (c-with ((sf-info %sndfile:info :clear t))
    (let ((sf-file (%sndfile:open *sample-file* %sndfile:+m-read+ (sf-info &))))
      (when (cffi:null-pointer-p sf-file)
        (error "Failed to open sound file ~A: ~A" *sample-file*
               (cffi:foreign-string-to-lisp (%sndfile:strerror sf-file))))
      (flet ((get-string (tag)
               (cffi:foreign-string-to-lisp
                (%sndfile:get-string sf-file tag))))
        (format t "File info: ~&Title: ~A~&Artist: ~A~&Date: ~A
Channels: ~A ~&Sample Rate: ~A ~&Frames: ~A"
                (get-string %sndfile:+str-title+)
                (get-string %sndfile:+str-artist+)
                (get-string %sndfile:+str-date+)

                (sf-info :channels)
                (sf-info :samplerate)
                (sf-info :frames))))))


(defun decode ()
  "Lispified decoding. Returns PCM data of *sample-file* in the array of (signed-byte 16) type."
  (sndfile:with-open-sound-file (sf-file *sample-file*)
    (sndfile:read-short-samples-into-array sf-file)))
