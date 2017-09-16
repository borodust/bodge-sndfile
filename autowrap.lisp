(cl:in-package :bodge-sndfile)


(autowrap:c-include
 '(bodge-sndfile "lib.h")
 :spec-path '(bodge-sndfile spec)
 :definition-package :%sndfile
 :sysincludes (append #+windows
		      (list "c:/msys64/mingw64/x86_64-w64-mingw32/include/"
			    "c:/msys64/mingw64/include/"
			    "c:/msys64/usr/local/include/"))
 :exclude-sources (".*.h")
 :include-sources ("sndfile.h")
 :include-definitions ("(sf|SF)_\\w*")
 :filter-spec-p t
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
