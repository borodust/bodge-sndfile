(asdf:defsystem bodge-sndfile
  :description "Wrapper over libsndfile for cl-bodge system"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria static-vectors cffi claw)
  :serial t
  :components ((:file "packages")
               (:file "libsndfile")
               (:static-file "lib.h")
               (:file "claw")
               (:file "main")
               (:module spec)))
