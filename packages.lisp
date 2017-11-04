(in-package :bodge-sndfile.def)


(defpackage :%sndfile
  (:use))


(defpackage :bodge-sndfile
  (:use :cl :bodge-autowrap :bodge-plus-c :alexandria)
  (:export with-open-sound-file
           with-sound-file-from-stream
           sound-sample-rate
           sound-channels
           read-short-samples-into-array))
