(cffi:define-foreign-library sf:libsndfile
  (:darwin "libsndfile.dylib.bodged")
  (:unix "libsndfile.so.bodged")
  (:windows "libsndfile.dll.bodged"))
