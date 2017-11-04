(in-package :cl-user)

(defpackage :bodge-sndfile.def
  (:use :cl :asdf))

(in-package :bodge-sndfile.def)


(defsystem bodge-sndfile
  :description "Wrapper over libsndfile for cl-bodge system"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria static-vectors cffi bodge-autowrap bodge-plus-c)
  :serial t
  :components ((:file "packages")
               (:file "libsndfile")
               (:static-file "lib.h")
               (:file "autowrap")
               (:file "main")
               (:module spec)))
