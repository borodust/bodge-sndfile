(cl:defpackage :%sndfile
  (:use))


(cl:defpackage :bodge-sndfile
  (:use :cl :claw :alexandria)
  (:export with-open-sound-file
           with-sound-file-from-stream
           sound-sample-rate
           sound-channels
           read-short-samples-into-array
           write-short-samples-into-stream))
