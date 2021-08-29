(claw:defwrapper (:bodge-sndfile/wrapper
                  (:headers "sndfile.h")
                  (:includes :sndfile-includes)
                  (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
                            ((:and :x86-64 :windows) "x86_64-w64-mingw32")
                            ((:and :x86-64 :darwin) "x86_64-apple-darwin-gnu"))
                  (:persistent :bodge-sndfile-bindings
                   :asd-path "../bodge-sndfile-bindings.asd"
                   :bindings-path "../bindings/"
                   :depends-on (:claw-utils))
                  (:include-definitions "(sf|SF).?_\\w*")
                  (:include-sources "sndfile.h"))

  :in-package :%sndfile
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :override-types ((:string claw-utils:claw-string)
                   (:pointer claw-utils:claw-pointer))
  :symbolicate-names (:by-removing-prefixes "sf_" "SF" "SF_"))
