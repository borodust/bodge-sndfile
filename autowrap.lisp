(cl:in-package :bodge-sndfile)


(bodge-autowrap:c-include "lib.h" :bodge-sndfile
 :package :%sndfile
 :include-sources ("sndfile.h")
 :include-definitions ("(sf|SF)_\\w*")
 :symbol-regex (("sf_\\w*" 3)
                ("SF._\\w*" 2)
                ("SF_\\w*" 3)))
