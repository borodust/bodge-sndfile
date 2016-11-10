(in-package :bodge-sndfile.def)


(defpackage :%sndfile)


(defpackage :bodge-sndfile
  (:use :cl :autowrap :plus-c :alexandria)
  (:export with-open-sound-file
           sound-sample-rate
           sound-channels
           read-short-samples-into-array))
