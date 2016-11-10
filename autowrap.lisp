(cl:in-package :%sndfile)


(autowrap:c-include '(bodge-sndfile spec "lib.h")
  :spec-path '(bodge-sndfile spec)
  :exclude-sources ("stdio.h" "stdint.h" "sys/types.h")
  :exclude-definitions ("^_" "^va_list$")
  :include-definitions ("size_t")
  :no-accessors cl:t)
