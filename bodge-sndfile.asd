(asdf:defsystem :bodge-sndfile
  :description "Wrapper over libsndfile for cl-bodge system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :static-vectors :cffi :cffi-c-ref
               :claw :claw-utils :bodge-libc-essentials)
  :serial t
  :pathname "src/"
  :components ((:file "packages")
               (:static-file "bodge_sndfile.h")
               (:file "claw")
               (:file "sndfile")
               (:module :spec)
               (:module :sndfile-includes :pathname "lib/sndfile/src/")))


(asdf:defsystem :bodge-sndfile/example
  :description "bodge-sndfile simple example"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:sndfile-blob :bodge-sndfile :cffi-c-ref)
  :pathname "example/"
  :serial t
  :components ((:file "example")))
