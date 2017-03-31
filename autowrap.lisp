(cl:in-package :bodge-sndfile)


(autowrap:c-include
 '(bodge-sndfile spec "lib.h")
 :spec-path '(bodge-sndfile spec)
 :definition-package :%sndfile
 :sysincludes (append #+windows
		      (list "c:/msys64/mingw64/x86_64-w64-mingw32/include/"
			    "c:/msys64/mingw64/include/"
			    "c:/msys64/usr/local/include/"))
 :exclude-arch ("arm-pc-linux-gnu"
		"i386-unknown-freebsd"
		"i386-unknown-openbsd"
		"i686-apple-darwin9"
		"i686-pc-linux-gnu"
		"i686-pc-windows-msvc"
		"x86_64-apple-darwin9"
		"x86_64-pc-linux-gnu"
		"x86_64-pc-windows-msvc"
		"x86_64-unknown-freebsd"
		"x86_64-unknown-openbsd")
 :exclude-sources (".*.h")
 :include-sources ("sndfile.h")
 :exclude-definitions ("vswprintf")
 :include-definitions ("wchar_t"
		       "size_t"
                       "int32_t"
                       "uint32_t"
                       "uint64_t"
                       "int64_t"
                       "count_t")
 :trace-c2ffi t
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
