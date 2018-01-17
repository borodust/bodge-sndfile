(claw:c-include "lib.h" :bodge-sndfile
  :in-package :%sndfile
  :include-sources ("sndfile.h")
  :include-definitions ("(sf|SF).?_\\w*")
  :rename-symbols (claw:by-removing-prefixes "sf_" "SF" "SF_"))
