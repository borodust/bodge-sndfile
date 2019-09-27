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
  (c-with ((sf-info %sf:info :clear t))
    (let ((sf-file (%sf:open *sample-file* %sf:+m-read+ (sf-info &))))
      (when (cffi:null-pointer-p sf-file)
        (error "Failed to open sound file ~A: ~A" *sample-file* (%sf:strerror sf-file)))
      (flet ((get-string (tag)
               (cffi:foreign-string-to-lisp
                (%sf:get-string sf-file tag))))
        (format t "File info: ~&Title: ~A~&Artist: ~A~&Date: ~A
Channels: ~A ~&Sample Rate: ~A ~&Frames: ~A"
                (get-string %sf:+str-title+)
                (get-string %sf:+str-artist+)
                (get-string %sf:+str-date+)

                (sf-info :channels)
                (sf-info :samplerate)
                (sf-info :frames))))))


(defun decode ()
  "Lispified decoding. Returns PCM data of *sample-file* in the array of (signed-byte 16) type."
  (sf:with-open-sound-file (sf-file *sample-file*)
    (sf:read-short-samples-into-array sf-file)))
