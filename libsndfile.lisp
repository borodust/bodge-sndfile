(cl:in-package :%sndfile)


(cffi:define-foreign-library libsndfile
  (:darwin (:or "libsndfile.1.dylib" "libsndfile.dylib"))
  (:unix (:or "libsndfile.so.1" "libsndfile.so"))
  (:windows "libsndfile.dll"))


(cffi:use-foreign-library libsndfile)
