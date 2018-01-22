(asdf:defsystem bodge-sndfile
  :description "Wrapper over libsndfile for cl-bodge system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria static-vectors cffi claw)
  :serial t
  :components ((:file "packages")
               (:file "libsndfile")
               (:static-file "bodge_sndfile.h")
               (:file "claw")
               (:file "main")
               (:module spec)
               (:module sndfile-includes :pathname "lib/sndfile/src/")))
