(claw:c-include "bodge_sndfile.h" :bodge-sndfile
  :in-package :%sndfile
  :sysincludes (:sndfile-includes)
  :include-sources ("sndfile.h")
  :include-definitions ("(sf|SF).?_\\w*")
  :windows-environment "msvc"
  :rename-symbols (claw:by-removing-prefixes "sf_" "SF" "SF_"))
