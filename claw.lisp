(claw:c-include "lib.h" :bodge-sndfile
 :package :%sndfile
 :include-sources ("sndfile.h")
 :include-definitions ("(sf|SF).?_\\w*")
 :symbol-prefix ("sf_" "SF" "SF_"))
