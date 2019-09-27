(uiop:define-package :%sndfile
  (:nicknames :%sf)
  (:use))


(claw:defwrapper (sndfile::bodge-sndfile
                  (:includes :sndfile-includes)
                  (:include-definitions "(sf|SF).?_\\w*"))
  :in-package :%sndfile
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :override-types ((:string claw-utils:claw-string)
                   (:pointer claw-utils:claw-pointer))
  :symbolicate-names (:by-removing-prefixes "sf_" "SF" "SF_"))
