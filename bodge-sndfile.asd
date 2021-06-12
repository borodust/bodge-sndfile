(asdf:defsystem :bodge-sndfile
  :description "Wrapper over libsndfile for cl-bodge system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :static-vectors :cffi :cffi-c-ref
               :bodge-libc-essentials :bodge-sndfile-bindings)
  :serial t
  :pathname "src/"
  :components ((:file "packages")
               (:file "sndfile")))


(asdf:defsystem :bodge-sndfile/wrapper
  :description "Wrapper over libsndfile for cl-bodge system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :uiop :cffi :claw-utils :claw)
  :pathname "src/"
  :serial t
  :components ((:file "claw")
               (:module :sndfile-includes :pathname "lib/sndfile/build/src/")))


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
