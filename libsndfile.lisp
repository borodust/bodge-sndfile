(cl:in-package :%sndfile)


(cffi:define-foreign-library libsndfile
  (:darwin (:or "libsndfile.1.dylib" "libsndfile.dylib"))
  (t (:default "libsndfile")))


(cffi:use-foreign-library libsndfile)
