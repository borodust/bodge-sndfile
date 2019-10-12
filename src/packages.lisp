(cl:defpackage :sndfile
  (:nicknames :sf)
  (:use :cl :claw :alexandria :cffi-c-ref)
  (:export #:with-open-sound-file
           #:with-sound-file-from-stream
           #:sound-sample-rate
           #:sound-channels
           #:read-short-samples-into-array
           #:write-short-samples-into-stream))