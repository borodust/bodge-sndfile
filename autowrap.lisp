(cl:in-package :bodge-sndfile)


(autowrap:c-include
 '(bodge-sndfile spec "lib.h")
 :spec-path '(bodge-sndfile spec)
 :definition-package :%sndfile
 :exclude-sources (".*.h")
 :include-sources ("sndfile.h")
 :include-definitions ("size_t"
                       "int32_t"
                       "uint32_t"
                       "uint64_t"
                       "int64_t"
                       "count_t")
 :no-accessors t
 :symbol-regex (("sf_\\w*" () (lambda (name matches regex)
                                   (declare (ignore matches regex))
                                   (subseq name 3)))
                ("SF.?_\\w*" () (lambda (name matches regex)
                                  (declare (ignore matches regex))
                                  (let ((pos (position #\_ name)))
                                    (if (> pos 2)
                                        (subseq name 2)
                                        (subseq name 3)))))))
