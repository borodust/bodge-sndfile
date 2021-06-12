(cl:defpackage :sndfile
  (:nicknames :sf)
  (:use :cl :alexandria :cffi-c-ref)
  (:export #:with-open-sound-file
           #:with-sound-file-from-stream

           #:sound-sample-rate
           #:sound-channels
           #:sound-format
           #:sound-frames

           #:read-short-samples-into-array
           #:write-short-samples-into-stream))
