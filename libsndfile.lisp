(cl:in-package :%sndfile)


(cffi:define-foreign-library libsndfile
  (:darwin (:or "libsndfile.1.dylib" "libsndfile.dylib"))
  (:unix (:or "libsndfile.so.1" "libsndfile.so"))
  (t (:default "libsndfile")))


(cffi:use-foreign-library libsndfile)
