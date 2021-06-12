(uiop:define-package :%sndfile (:use))
(uiop:define-package :bodge-sndfile-bindings~pristine (:use :cl))
(common-lisp:in-package :bodge-sndfile-bindings~pristine)

(defparameter %sndfile::+count-max+ 9223372036854775807)

(defparameter %sndfile::+str-first+ 1)

(defparameter %sndfile::+str-last+ 16)

(defparameter %sndfile::+c-get-lib-version+ 4096)

(defparameter %sndfile::+c-get-log-info+ 4097)

(defparameter %sndfile::+c-get-current-sf-info+ 4098)

(defparameter %sndfile::+c-get-norm-double+ 4112)

(defparameter %sndfile::+c-get-norm-float+ 4113)

(defparameter %sndfile::+c-set-norm-double+ 4114)

(defparameter %sndfile::+c-set-norm-float+ 4115)

(defparameter %sndfile::+c-set-scale-float-int-read+ 4116)

(defparameter %sndfile::+c-set-scale-int-float-write+ 4117)

(defparameter %sndfile::+c-get-simple-format-count+ 4128)

(defparameter %sndfile::+c-get-simple-format+ 4129)

(defparameter %sndfile::+c-get-format-info+ 4136)

(defparameter %sndfile::+c-get-format-major-count+ 4144)

(defparameter %sndfile::+c-get-format-major+ 4145)

(defparameter %sndfile::+c-get-format-subtype-count+ 4146)

(defparameter %sndfile::+c-get-format-subtype+ 4147)

(defparameter %sndfile::+c-calc-signal-max+ 4160)

(defparameter %sndfile::+c-calc-norm-signal-max+ 4161)

(defparameter %sndfile::+c-calc-max-all-channels+ 4162)

(defparameter %sndfile::+c-calc-norm-max-all-channels+ 4163)

(defparameter %sndfile::+c-get-signal-max+ 4164)

(defparameter %sndfile::+c-get-max-all-channels+ 4165)

(defparameter %sndfile::+c-set-add-peak-chunk+ 4176)

(defparameter %sndfile::+c-update-header-now+ 4192)

(defparameter %sndfile::+c-set-update-header-auto+ 4193)

(defparameter %sndfile::+c-file-truncate+ 4224)

(defparameter %sndfile::+c-set-raw-start-offset+ 4240)

(defparameter %sndfile::+c-set-dither-on-write+ 4256)

(defparameter %sndfile::+c-set-dither-on-read+ 4257)

(defparameter %sndfile::+c-get-dither-info-count+ 4258)

(defparameter %sndfile::+c-get-dither-info+ 4259)

(defparameter %sndfile::+c-get-embed-file-info+ 4272)

(defparameter %sndfile::+c-set-clipping+ 4288)

(defparameter %sndfile::+c-get-clipping+ 4289)

(defparameter %sndfile::+c-get-cue-count+ 4301)

(defparameter %sndfile::+c-get-cue+ 4302)

(defparameter %sndfile::+c-set-cue+ 4303)

(defparameter %sndfile::+c-get-instrument+ 4304)

(defparameter %sndfile::+c-set-instrument+ 4305)

(defparameter %sndfile::+c-get-loop-info+ 4320)

(defparameter %sndfile::+c-get-broadcast-info+ 4336)

(defparameter %sndfile::+c-set-broadcast-info+ 4337)

(defparameter %sndfile::+c-get-channel-map-info+ 4352)

(defparameter %sndfile::+c-set-channel-map-info+ 4353)

(defparameter %sndfile::+c-raw-data-needs-endswap+ 4368)

(defparameter %sndfile::+c-wavex-set-ambisonic+ 4608)

(defparameter %sndfile::+c-wavex-get-ambisonic+ 4609)

(defparameter %sndfile::+c-rf64-auto-downgrade+ 4624)

(defparameter %sndfile::+c-set-vbr-encoding-quality+ 4864)

(defparameter %sndfile::+c-set-compression-level+ 4865)

(defparameter %sndfile::+c-set-cart-info+ 5120)

(defparameter %sndfile::+c-get-cart-info+ 5121)

(defparameter %sndfile::+c-set-original-samplerate+ 5376)

(defparameter %sndfile::+c-get-original-samplerate+ 5377)

(defparameter %sndfile::+c-test-ieee-float-replace+ 24577)

(defparameter %sndfile::+c-set-add-header-pad-chunk+ 4177)

(defparameter %sndfile::+c-set-add-dither-on-write+ 4208)

(defparameter %sndfile::+c-set-add-dither-on-read+ 4209)

(defparameter %sndfile::+d-default-level+ 0)

(defparameter %sndfile::+d-custom-level+ 1073741824)

(defparameter %sndfile::+d-no-dither+ 500)

(defparameter %sndfile::+d-white+ 501)

(defparameter %sndfile::+d-triangular-pdf+ 502)

(defparameter %sndfile::+channel-map-invalid+ 0)

(defparameter %sndfile::+channel-map-mono+ 1)

(defparameter %sndfile::+channel-map-left+ 2)

(defparameter %sndfile::+channel-map-right+ 3)

(defparameter %sndfile::+channel-map-center+ 4)

(defparameter %sndfile::+channel-map-front-left+ 5)

(defparameter %sndfile::+channel-map-front-right+ 6)

(defparameter %sndfile::+channel-map-front-center+ 7)

(defparameter %sndfile::+channel-map-rear-center+ 8)

(defparameter %sndfile::+channel-map-rear-left+ 9)

(defparameter %sndfile::+channel-map-rear-right+ 10)

(defparameter %sndfile::+channel-map-lfe+ 11)

(defparameter %sndfile::+channel-map-front-left-of-center+ 12)

(defparameter %sndfile::+channel-map-front-right-of-center+ 13)

(defparameter %sndfile::+channel-map-side-left+ 14)

(defparameter %sndfile::+channel-map-side-right+ 15)

(defparameter %sndfile::+channel-map-top-center+ 16)

(defparameter %sndfile::+channel-map-top-front-left+ 17)

(defparameter %sndfile::+channel-map-top-front-right+ 18)

(defparameter %sndfile::+channel-map-top-front-center+ 19)

(defparameter %sndfile::+channel-map-top-rear-left+ 20)

(defparameter %sndfile::+channel-map-top-rear-right+ 21)

(defparameter %sndfile::+channel-map-top-rear-center+ 22)

(defparameter %sndfile::+channel-map-ambisonic-b-w+ 23)

(defparameter %sndfile::+channel-map-ambisonic-b-x+ 24)

(defparameter %sndfile::+channel-map-ambisonic-b-y+ 25)

(defparameter %sndfile::+channel-map-ambisonic-b-z+ 26)

(defparameter %sndfile::+channel-map-max+ 27)

(defparameter %sndfile::+err-no-error+ 0)

(defparameter %sndfile::+err-unrecognised-format+ 1)

(defparameter %sndfile::+err-system+ 2)

(defparameter %sndfile::+err-malformed-file+ 3)

(defparameter %sndfile::+err-unsupported-encoding+ 4)

(defparameter %sndfile::+false+ 0)

(defparameter %sndfile::+true+ 1)

(defparameter %sndfile::+m-read+ 16)

(defparameter %sndfile::+m-write+ 32)

(defparameter %sndfile::+m-rdwr+ 48)

(defparameter %sndfile::+ambisonic-none+ 64)

(defparameter %sndfile::+ambisonic-b-format+ 65)

(defparameter %sndfile::+format-wav+ 65536)

(defparameter %sndfile::+format-aiff+ 131072)

(defparameter %sndfile::+format-au+ 196608)

(defparameter %sndfile::+format-raw+ 262144)

(defparameter %sndfile::+format-paf+ 327680)

(defparameter %sndfile::+format-svx+ 393216)

(defparameter %sndfile::+format-nist+ 458752)

(defparameter %sndfile::+format-voc+ 524288)

(defparameter %sndfile::+format-ircam+ 655360)

(defparameter %sndfile::+format-w64+ 720896)

(defparameter %sndfile::+format-mat4+ 786432)

(defparameter %sndfile::+format-mat5+ 851968)

(defparameter %sndfile::+format-pvf+ 917504)

(defparameter %sndfile::+format-xi+ 983040)

(defparameter %sndfile::+format-htk+ 1048576)

(defparameter %sndfile::+format-sds+ 1114112)

(defparameter %sndfile::+format-avr+ 1179648)

(defparameter %sndfile::+format-wavex+ 1245184)

(defparameter %sndfile::+format-sd2+ 1441792)

(defparameter %sndfile::+format-flac+ 1507328)

(defparameter %sndfile::+format-caf+ 1572864)

(defparameter %sndfile::+format-wve+ 1638400)

(defparameter %sndfile::+format-ogg+ 2097152)

(defparameter %sndfile::+format-mpc2k+ 2162688)

(defparameter %sndfile::+format-rf64+ 2228224)

(defparameter %sndfile::+format-pcm-s8+ 1)

(defparameter %sndfile::+format-pcm-16+ 2)

(defparameter %sndfile::+format-pcm-24+ 3)

(defparameter %sndfile::+format-pcm-32+ 4)

(defparameter %sndfile::+format-pcm-u8+ 5)

(defparameter %sndfile::+format-float+ 6)

(defparameter %sndfile::+format-double+ 7)

(defparameter %sndfile::+format-ulaw+ 16)

(defparameter %sndfile::+format-alaw+ 17)

(defparameter %sndfile::+format-ima-adpcm+ 18)

(defparameter %sndfile::+format-ms-adpcm+ 19)

(defparameter %sndfile::+format-gsm610+ 32)

(defparameter %sndfile::+format-vox-adpcm+ 33)

(defparameter %sndfile::+format-nms-adpcm-16+ 34)

(defparameter %sndfile::+format-nms-adpcm-24+ 35)

(defparameter %sndfile::+format-nms-adpcm-32+ 36)

(defparameter %sndfile::+format-g721-32+ 48)

(defparameter %sndfile::+format-g723-24+ 49)

(defparameter %sndfile::+format-g723-40+ 50)

(defparameter %sndfile::+format-dwvw-12+ 64)

(defparameter %sndfile::+format-dwvw-16+ 65)

(defparameter %sndfile::+format-dwvw-24+ 66)

(defparameter %sndfile::+format-dwvw-n+ 67)

(defparameter %sndfile::+format-dpcm-8+ 80)

(defparameter %sndfile::+format-dpcm-16+ 81)

(defparameter %sndfile::+format-vorbis+ 96)

(defparameter %sndfile::+format-opus+ 100)

(defparameter %sndfile::+format-alac-16+ 112)

(defparameter %sndfile::+format-alac-20+ 113)

(defparameter %sndfile::+format-alac-24+ 114)

(defparameter %sndfile::+format-alac-32+ 115)

(defparameter %sndfile::+endian-file+ 0)

(defparameter %sndfile::+endian-little+ 268435456)

(defparameter %sndfile::+endian-big+ 536870912)

(defparameter %sndfile::+endian-cpu+ 805306368)

(defparameter %sndfile::+format-submask+ 65535)

(defparameter %sndfile::+format-typemask+ 268369920)

(defparameter %sndfile::+format-endmask+ 805306368)

(defparameter %sndfile::+loop-none+ 800)

(defparameter %sndfile::+loop-forward+ 801)

(defparameter %sndfile::+loop-backward+ 802)

(defparameter %sndfile::+loop-alternating+ 803)

(defparameter %sndfile::+seek-set+ 0)

(defparameter %sndfile::+seek-cur+ 1)

(defparameter %sndfile::+seek-end+ 2)

(defparameter %sndfile::+str-title+ 1)

(defparameter %sndfile::+str-copyright+ 2)

(defparameter %sndfile::+str-software+ 3)

(defparameter %sndfile::+str-artist+ 4)

(defparameter %sndfile::+str-comment+ 5)

(defparameter %sndfile::+str-date+ 6)

(defparameter %sndfile::+str-album+ 7)

(defparameter %sndfile::+str-license+ 8)

(defparameter %sndfile::+str-tracknumber+ 9)

(defparameter %sndfile::+str-genre+ 16)

(cffi:defcstruct (%sndfile::sndfile-tag :size 0))

(cffi:defctype %sndfile::sndfile (:struct %sndfile::sndfile-tag))

(declaim (inline %sndfile::close))

(cffi:defcfun ("sf_close" %sndfile::close)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile)))

(declaim (inline %sndfile::command))

(cffi:defcfun ("sf_command" %sndfile::command)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::command :int)
              (%sndfile::data (claw-utils:claw-pointer :void))
              (%sndfile::datasize :int))

(declaim (inline %sndfile::current-byterate))

(cffi:defcfun ("sf_current_byterate" %sndfile::current-byterate)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile)))

(declaim (inline %sndfile::error))

(cffi:defcfun ("sf_error" %sndfile::error)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile)))

(declaim (inline %sndfile::error-number))

(cffi:defcfun ("sf_error_number" %sndfile::error-number)
              claw-utils:claw-string
              (%sndfile::errnum :int))

(cffi:defctype %sndfile::size-t :unsigned-long)

(declaim (inline %sndfile::error-str))

(cffi:defcfun ("sf_error_str" %sndfile::error-str)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::str claw-utils:claw-string)
              (%sndfile::len %sndfile::size-t))

(cffi:defctype %sndfile::count-t :long)

(cffi:defcstruct (%sndfile::info :size 32)
                 (%sndfile::frames %sndfile::count-t :offset 0)
                 (%sndfile::samplerate :int :offset 8)
                 (%sndfile::channels :int :offset 12)
                 (%sndfile::format :int :offset 16)
                 (%sndfile::sections :int :offset 20)
                 (%sndfile::seekable :int :offset 24))

(cffi:defctype %sndfile::info (:struct %sndfile::info))

(declaim (inline %sndfile::format-check))

(cffi:defcfun ("sf_format_check" %sndfile::format-check)
              :int
              (%sndfile::info
               (claw-utils:claw-pointer %sndfile::info)))

(cffi:defcstruct (%sndfile::chunk-iterator :size 0))

(cffi:defctype %sndfile::chunk-iterator
               (:struct %sndfile::chunk-iterator))

(cffi:defcstruct (%sndfile::chunk-info :size 80)
                 (%sndfile::id :char :count 64 :offset 0)
                 (%sndfile::id-size :unsigned-int :offset 64)
                 (%sndfile::datalen :unsigned-int :offset 68)
                 (%sndfile::data (claw-utils:claw-pointer :void)
                  :offset 72))

(cffi:defctype %sndfile::chunk-info (:struct %sndfile::chunk-info))

(declaim (inline %sndfile::get-chunk-data))

(cffi:defcfun ("sf_get_chunk_data" %sndfile::get-chunk-data)
              :int
              (%sndfile::it
               (claw-utils:claw-pointer %sndfile::chunk-iterator))
              (%sndfile::chunk-info
               (claw-utils:claw-pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::get-chunk-iterator))

(cffi:defcfun ("sf_get_chunk_iterator" %sndfile::get-chunk-iterator)
              (claw-utils:claw-pointer %sndfile::chunk-iterator)
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::chunk-info
               (claw-utils:claw-pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::get-chunk-size))

(cffi:defcfun ("sf_get_chunk_size" %sndfile::get-chunk-size)
              :int
              (%sndfile::it
               (claw-utils:claw-pointer %sndfile::chunk-iterator))
              (%sndfile::chunk-info
               (claw-utils:claw-pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::get-string))

(cffi:defcfun ("sf_get_string" %sndfile::get-string)
              claw-utils:claw-string
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::str-type :int))

(declaim (inline %sndfile::next-chunk-iterator))

(cffi:defcfun ("sf_next_chunk_iterator"
               %sndfile::next-chunk-iterator)
              (claw-utils:claw-pointer %sndfile::chunk-iterator)
              (%sndfile::iterator
               (claw-utils:claw-pointer %sndfile::chunk-iterator)))

(declaim (inline %sndfile::open))

(cffi:defcfun ("sf_open" %sndfile::open)
              (claw-utils:claw-pointer %sndfile::sndfile)
              (%sndfile::path claw-utils:claw-string)
              (%sndfile::mode :int)
              (%sndfile::sfinfo
               (claw-utils:claw-pointer %sndfile::info)))

(declaim (inline %sndfile::open-fd))

(cffi:defcfun ("sf_open_fd" %sndfile::open-fd)
              (claw-utils:claw-pointer %sndfile::sndfile)
              (%sndfile::fd :int)
              (%sndfile::mode :int)
              (%sndfile::sfinfo
               (claw-utils:claw-pointer %sndfile::info))
              (%sndfile::close-desc :int))

(cffi:defctype %sndfile::vio-get-filelen
               (claw-utils:claw-pointer :void))

(cffi:defctype %sndfile::vio-seek (claw-utils:claw-pointer :void))

(cffi:defctype %sndfile::vio-read (claw-utils:claw-pointer :void))

(cffi:defctype %sndfile::vio-write (claw-utils:claw-pointer :void))

(cffi:defctype %sndfile::vio-tell (claw-utils:claw-pointer :void))

(cffi:defcstruct (%sndfile::virtual-io :size 40)
                 (%sndfile::get-filelen %sndfile::vio-get-filelen
                  :offset 0)
                 (%sndfile::seek %sndfile::vio-seek :offset 8)
                 (%sndfile::read %sndfile::vio-read :offset 16)
                 (%sndfile::write %sndfile::vio-write :offset 24)
                 (%sndfile::tell %sndfile::vio-tell :offset 32))

(cffi:defctype %sndfile::virtual-io (:struct %sndfile::virtual-io))

(declaim (inline %sndfile::open-virtual))

(cffi:defcfun ("sf_open_virtual" %sndfile::open-virtual)
              (claw-utils:claw-pointer %sndfile::sndfile)
              (%sndfile::sfvirtual
               (claw-utils:claw-pointer %sndfile::virtual-io))
              (%sndfile::mode :int)
              (%sndfile::sfinfo
               (claw-utils:claw-pointer %sndfile::info))
              (%sndfile::user-data (claw-utils:claw-pointer :void)))

(declaim (inline %sndfile::perror))

(cffi:defcfun ("sf_perror" %sndfile::perror)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile)))

(declaim (inline %sndfile::read-double))

(cffi:defcfun ("sf_read_double" %sndfile::read-double)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :double))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::read-float))

(cffi:defcfun ("sf_read_float" %sndfile::read-float)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :float))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::read-int))

(cffi:defcfun ("sf_read_int" %sndfile::read-int)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :int))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::read-raw))

(cffi:defcfun ("sf_read_raw" %sndfile::read-raw)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :void))
              (%sndfile::bytes %sndfile::count-t))

(declaim (inline %sndfile::read-short))

(cffi:defcfun ("sf_read_short" %sndfile::read-short)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :short))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::readf-double))

(cffi:defcfun ("sf_readf_double" %sndfile::readf-double)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :double))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::readf-float))

(cffi:defcfun ("sf_readf_float" %sndfile::readf-float)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :float))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::readf-int))

(cffi:defcfun ("sf_readf_int" %sndfile::readf-int)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :int))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::readf-short))

(cffi:defcfun ("sf_readf_short" %sndfile::readf-short)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :short))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::seek))

(cffi:defcfun ("sf_seek" %sndfile::seek)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::frames %sndfile::count-t)
              (%sndfile::whence :int))

(declaim (inline %sndfile::set-chunk))

(cffi:defcfun ("sf_set_chunk" %sndfile::set-chunk)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::chunk-info
               (claw-utils:claw-pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::set-string))

(cffi:defcfun ("sf_set_string" %sndfile::set-string)
              :int
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::str-type :int)
              (%sndfile::str claw-utils:claw-string))

(declaim (inline %sndfile::strerror))

(cffi:defcfun ("sf_strerror" %sndfile::strerror)
              claw-utils:claw-string
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile)))

(declaim (inline %sndfile::version-string))

(cffi:defcfun ("sf_version_string" %sndfile::version-string)
              claw-utils:claw-string)

(declaim (inline %sndfile::write-double))

(cffi:defcfun ("sf_write_double" %sndfile::write-double)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :double))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-float))

(cffi:defcfun ("sf_write_float" %sndfile::write-float)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :float))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-int))

(cffi:defcfun ("sf_write_int" %sndfile::write-int)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :int))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-raw))

(cffi:defcfun ("sf_write_raw" %sndfile::write-raw)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :void))
              (%sndfile::bytes %sndfile::count-t))

(declaim (inline %sndfile::write-short))

(cffi:defcfun ("sf_write_short" %sndfile::write-short)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :short))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-sync))

(cffi:defcfun ("sf_write_sync" %sndfile::write-sync)
              :void
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile)))

(declaim (inline %sndfile::writef-double))

(cffi:defcfun ("sf_writef_double" %sndfile::writef-double)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :double))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::writef-float))

(cffi:defcfun ("sf_writef_float" %sndfile::writef-float)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :float))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::writef-int))

(cffi:defcfun ("sf_writef_int" %sndfile::writef-int)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :int))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::writef-short))

(cffi:defcfun ("sf_writef_short" %sndfile::writef-short)
              %sndfile::count-t
              (%sndfile::sndfile
               (claw-utils:claw-pointer %sndfile::sndfile))
              (%sndfile::ptr (claw-utils:claw-pointer :short))
              (%sndfile::frames %sndfile::count-t))

(cffi:defctype %sndfile::int32-t :int)

(cffi:defcstruct (%sndfile::cart-timer :size 8)
                 (%sndfile::usage :char :count 4 :offset 0)
                 (%sndfile::value %sndfile::int32-t :offset 4))

(cffi:defctype %sndfile::int16-t :short)

(cffi:defctype %sndfile::uint32-t :unsigned-int)

(cffi:defcstruct (%sndfile::|C:@SA@SF-BROADCAST-INFO| :size 864)
                 (%sndfile::description :char :count 256 :offset 0)
                 (%sndfile::originator :char :count 32 :offset 256)
                 (%sndfile::originator-reference :char :count 32
                  :offset 288)
                 (%sndfile::origination-date :char :count 10 :offset
                  320)
                 (%sndfile::origination-time :char :count 8 :offset
                  330)
                 (%sndfile::time-reference-low %sndfile::uint32-t
                  :offset 340)
                 (%sndfile::time-reference-high %sndfile::uint32-t
                  :offset 344)
                 (%sndfile::version :short :offset 348)
                 (%sndfile::umid :char :count 64 :offset 350)
                 (%sndfile::loudness-value %sndfile::int16-t :offset
                  414)
                 (%sndfile::loudness-range %sndfile::int16-t :offset
                  416)
                 (%sndfile::max-true-peak-level %sndfile::int16-t
                  :offset 418)
                 (%sndfile::max-momentary-loudness %sndfile::int16-t
                  :offset 420)
                 (%sndfile::max-shortterm-loudness %sndfile::int16-t
                  :offset 422)
                 (%sndfile::reserved :char :count 180 :offset 424)
                 (%sndfile::coding-history-size %sndfile::uint32-t
                  :offset 604)
                 (%sndfile::coding-history :char :count 256 :offset
                  608))

(cffi:defctype %sndfile::cart-timer (:struct %sndfile::cart-timer))

(cffi:defcstruct (%sndfile::|C:@SA@SF-CART-INFO| :size 2308)
                 (%sndfile::version :char :count 4 :offset 0)
                 (%sndfile::title :char :count 64 :offset 4)
                 (%sndfile::artist :char :count 64 :offset 68)
                 (%sndfile::cut-id :char :count 64 :offset 132)
                 (%sndfile::client-id :char :count 64 :offset 196)
                 (%sndfile::category :char :count 64 :offset 260)
                 (%sndfile::classification :char :count 64 :offset
                  324)
                 (%sndfile::out-cue :char :count 64 :offset 388)
                 (%sndfile::start-date :char :count 10 :offset 452)
                 (%sndfile::start-time :char :count 8 :offset 462)
                 (%sndfile::end-date :char :count 10 :offset 470)
                 (%sndfile::end-time :char :count 8 :offset 480)
                 (%sndfile::producer-app-id :char :count 64 :offset
                  488)
                 (%sndfile::producer-app-version :char :count 64
                  :offset 552)
                 (%sndfile::user-def :char :count 64 :offset 616)
                 (%sndfile::level-reference %sndfile::int32-t :offset
                  680)
                 (%sndfile::post-timers %sndfile::cart-timer :count 8
                  :offset 684)
                 (%sndfile::reserved :char :count 276 :offset 748)
                 (%sndfile::url :char :count 1024 :offset 1024)
                 (%sndfile::tag-text-size %sndfile::uint32-t :offset
                  2048)
                 (%sndfile::tag-text :char :count 256 :offset 2052))

(cffi:defcstruct (%sndfile::|C:@SA@SF-CUE-POINT| :size 280)
                 (%sndfile::indx %sndfile::int32-t :offset 0)
                 (%sndfile::position %sndfile::uint32-t :offset 4)
                 (%sndfile::fcc-chunk %sndfile::int32-t :offset 8)
                 (%sndfile::chunk-start %sndfile::int32-t :offset 12)
                 (%sndfile::block-start %sndfile::int32-t :offset 16)
                 (%sndfile::sample-offset %sndfile::uint32-t :offset
                  20)
                 (%sndfile::name :char :count 256 :offset 24))

(cffi:defctype %sndfile::cue-point
               (:struct %sndfile::|C:@SA@SF-CUE-POINT|))

(cffi:defcstruct (%sndfile::|C:@SA@SF-CUES| :size 28004)
                 (%sndfile::cue-count %sndfile::uint32-t :offset 0)
                 (%sndfile::cue-points %sndfile::cue-point :count 100
                  :offset 4))

(cffi:defcstruct (%sndfile::|C:@SA@SF-DITHER-INFO| :size 24)
                 (%sndfile::type :int :offset 0)
                 (%sndfile::level :double :offset 8)
                 (%sndfile::name claw-utils:claw-string :offset 16))

(cffi:defcstruct (%sndfile::|C:@SA@SF-EMBED-FILE-INFO| :size 16)
                 (%sndfile::offset %sndfile::count-t :offset 0)
                 (%sndfile::length %sndfile::count-t :offset 8))

(cffi:defcstruct (%sndfile::|C:@SA@SF-FORMAT-INFO| :size 24)
                 (%sndfile::format :int :offset 0)
                 (%sndfile::name claw-utils:claw-string :offset 8)
                 (%sndfile::extension claw-utils:claw-string :offset
                  16))

(cffi:defcstruct (%sndfile::|C:@SA@SF-INSTRUMENT@S@SNDFILE.H@14463|
                  :size 16)
                 (%sndfile::mode :int :offset 0)
                 (%sndfile::start %sndfile::uint32-t :offset 4)
                 (%sndfile::end %sndfile::uint32-t :offset 8)
                 (%sndfile::count %sndfile::uint32-t :offset 12))

(cffi:defcstruct (%sndfile::|C:@SA@SF-INSTRUMENT| :size 272)
                 (%sndfile::gain :int :offset 0)
                 (%sndfile::basenote :char :offset 4)
                 (%sndfile::detune :char :offset 5)
                 (%sndfile::velocity-lo :char :offset 6)
                 (%sndfile::velocity-hi :char :offset 7)
                 (%sndfile::key-lo :char :offset 8)
                 (%sndfile::key-hi :char :offset 9)
                 (%sndfile::loop-count :int :offset 12)
                 (%sndfile::loops
                  (:struct
                   %sndfile::|C:@SA@SF-INSTRUMENT@S@SNDFILE.H@14463|)
                  :count 16 :offset 16))

(cffi:defcstruct (%sndfile::|C:@SA@SF-LOOP-INFO| :size 44)
                 (%sndfile::time-sig-num :short :offset 0)
                 (%sndfile::time-sig-den :short :offset 2)
                 (%sndfile::loop-mode :int :offset 4)
                 (%sndfile::num-beats :int :offset 8)
                 (%sndfile::bpm :float :offset 12)
                 (%sndfile::root-key :int :offset 16)
                 (%sndfile::future :int :count 6 :offset 20))

(cffi:defctype %sndfile::broadcast-info
               (:struct %sndfile::|C:@SA@SF-BROADCAST-INFO|))

(cffi:defctype %sndfile::cart-info
               (:struct %sndfile::|C:@SA@SF-CART-INFO|))

(cffi:defctype %sndfile::cues (:struct %sndfile::|C:@SA@SF-CUES|))

(cffi:defctype %sndfile::dither-info
               (:struct %sndfile::|C:@SA@SF-DITHER-INFO|))

(cffi:defctype %sndfile::embed-file-info
               (:struct %sndfile::|C:@SA@SF-EMBED-FILE-INFO|))

(cffi:defctype %sndfile::format-info
               (:struct %sndfile::|C:@SA@SF-FORMAT-INFO|))

(cffi:defctype %sndfile::instrument
               (:struct %sndfile::|C:@SA@SF-INSTRUMENT|))

(cffi:defctype %sndfile::loop-info
               (:struct %sndfile::|C:@SA@SF-LOOP-INFO|))

(eval-when (:load-toplevel :compile-toplevel :execute)
  (export '%sndfile::+channel-map-front-left-of-center+ :%sndfile)
  (export '%sndfile::format-info :%sndfile)
  (export '%sndfile::+c-get-max-all-channels+ :%sndfile)
  (export '%sndfile::+format-pvf+ :%sndfile)
  (export '%sndfile::write :%sndfile)
  (export '%sndfile::+c-set-cart-info+ :%sndfile)
  (export '%sndfile::+c-get-current-sf-info+ :%sndfile)
  (export '%sndfile::+channel-map-side-right+ :%sndfile)
  (export '%sndfile::+c-get-instrument+ :%sndfile)
  (export '%sndfile::tag-text-size :%sndfile)
  (export '%sndfile::max-true-peak-level :%sndfile)
  (export '%sndfile::+c-get-norm-double+ :%sndfile)
  (export '%sndfile::+c-get-embed-file-info+ :%sndfile)
  (export '%sndfile::set-string :%sndfile)
  (export '%sndfile::+format-rf64+ :%sndfile)
  (export '%sndfile::vio-get-filelen :%sndfile)
  (export '%sndfile::+format-opus+ :%sndfile)
  (export '%sndfile::+c-get-format-subtype+ :%sndfile)
  (export '%sndfile::vio-read :%sndfile)
  (export '%sndfile::+d-triangular-pdf+ :%sndfile)
  (export '%sndfile::chunk-info :%sndfile)
  (export '%sndfile::+c-set-cue+ :%sndfile)
  (export '%sndfile::+err-unsupported-encoding+ :%sndfile)
  (export '%sndfile::time-sig-num :%sndfile)
  (export '%sndfile::+c-set-scale-float-int-read+ :%sndfile)
  (export '%sndfile::+loop-none+ :%sndfile)
  (export '%sndfile::+format-g723-40+ :%sndfile)
  (export '%sndfile::+channel-map-ambisonic-b-z+ :%sndfile)
  (export '%sndfile::+c-set-add-peak-chunk+ :%sndfile)
  (export '%sndfile::+c-get-dither-info+ :%sndfile)
  (export '%sndfile::readf-float :%sndfile)
  (export '%sndfile::+err-malformed-file+ :%sndfile)
  (export '%sndfile::+format-pcm-s8+ :%sndfile)
  (export '%sndfile::+d-custom-level+ :%sndfile)
  (export '%sndfile::count :%sndfile)
  (export '%sndfile::+c-set-add-dither-on-write+ :%sndfile)
  (export '%sndfile::frames :%sndfile)
  (export '%sndfile::+c-test-ieee-float-replace+ :%sndfile)
  (export '%sndfile::+channel-map-front-right-of-center+ :%sndfile)
  (export '%sndfile::strerror :%sndfile)
  (export '%sndfile::+endian-cpu+ :%sndfile)
  (export '%sndfile::+format-svx+ :%sndfile)
  (export '%sndfile::+format-sds+ :%sndfile)
  (export '%sndfile::+channel-map-top-rear-center+ :%sndfile)
  (export '%sndfile::+str-title+ :%sndfile)
  (export '%sndfile::+channel-map-side-left+ :%sndfile)
  (export '%sndfile::+format-alac-32+ :%sndfile)
  (export '%sndfile::+c-set-channel-map-info+ :%sndfile)
  (export '%sndfile::+channel-map-rear-left+ :%sndfile)
  (export '%sndfile::get-string :%sndfile)
  (export '%sndfile::+str-license+ :%sndfile)
  (export '%sndfile::block-start :%sndfile)
  (export '%sndfile::+format-sd2+ :%sndfile)
  (export '%sndfile::+c-get-format-major-count+ :%sndfile)
  (export '%sndfile::+format-pcm-32+ :%sndfile)
  (export '%sndfile::+c-get-cart-info+ :%sndfile)
  (export '%sndfile::indx :%sndfile)
  (export '%sndfile::user-def :%sndfile)
  (export '%sndfile::sections :%sndfile)
  (export '%sndfile::|C:@SA@SF-CUES| :%sndfile)
  (export '%sndfile::count-t :%sndfile)
  (export '%sndfile::+channel-map-front-center+ :%sndfile)
  (export '%sndfile::+format-endmask+ :%sndfile)
  (export '%sndfile::get-chunk-iterator :%sndfile)
  (export '%sndfile::readf-int :%sndfile)
  (export '%sndfile::name :%sndfile)
  (export '%sndfile::position :%sndfile)
  (export '%sndfile::writef-int :%sndfile)
  (export '%sndfile::vio-write :%sndfile)
  (export '%sndfile::writef-double :%sndfile)
  (export '%sndfile::+format-dwvw-12+ :%sndfile)
  (export '%sndfile::|C:@SA@SF-INSTRUMENT| :%sndfile)
  (export '%sndfile::gain :%sndfile)
  (export '%sndfile::+format-pcm-24+ :%sndfile)
  (export '%sndfile::+channel-map-max+ :%sndfile)
  (export '%sndfile::+channel-map-rear-center+ :%sndfile)
  (export '%sndfile::+c-file-truncate+ :%sndfile)
  (export '%sndfile::|C:@SA@SF-DITHER-INFO| :%sndfile)
  (export '%sndfile::mode :%sndfile)
  (export '%sndfile::+c-get-dither-info-count+ :%sndfile)
  (export '%sndfile::time-reference-low :%sndfile)
  (export '%sndfile::detune :%sndfile)
  (export '%sndfile::root-key :%sndfile)
  (export '%sndfile::+format-vorbis+ :%sndfile)
  (export '%sndfile::+format-pcm-u8+ :%sndfile)
  (export '%sndfile::uint32-t :%sndfile)
  (export '%sndfile::cue-point :%sndfile)
  (export '%sndfile::+format-ircam+ :%sndfile)
  (export '%sndfile::+d-no-dither+ :%sndfile)
  (export '%sndfile::+format-htk+ :%sndfile)
  (export '%sndfile::+channel-map-rear-right+ :%sndfile)
  (export '%sndfile::time-reference-high :%sndfile)
  (export '%sndfile::+format-dwvw-24+ :%sndfile)
  (export '%sndfile::chunk-iterator :%sndfile)
  (export '%sndfile::virtual-io :%sndfile)
  (export '%sndfile::originator-reference :%sndfile)
  (export '%sndfile::sample-offset :%sndfile)
  (export '%sndfile::readf-short :%sndfile)
  (export '%sndfile::format :%sndfile)
  (export '%sndfile::velocity-lo :%sndfile)
  (export '%sndfile::level :%sndfile)
  (export '%sndfile::vio-seek :%sndfile)
  (export '%sndfile::instrument :%sndfile)
  (export '%sndfile::next-chunk-iterator :%sndfile)
  (export '%sndfile::+c-get-cue+ :%sndfile)
  (export '%sndfile::+format-ms-adpcm+ :%sndfile)
  (export '%sndfile::length :%sndfile)
  (export '%sndfile::write-sync :%sndfile)
  (export '%sndfile::future :%sndfile)
  (export '%sndfile::+format-alac-16+ :%sndfile)
  (export '%sndfile::write-float :%sndfile)
  (export '%sndfile::+format-wve+ :%sndfile)
  (export '%sndfile::+c-set-add-dither-on-read+ :%sndfile)
  (export '%sndfile::tell :%sndfile)
  (export '%sndfile::description :%sndfile)
  (export '%sndfile::producer-app-version :%sndfile)
  (export '%sndfile::key-hi :%sndfile)
  (export '%sndfile::+c-set-norm-double+ :%sndfile)
  (export '%sndfile::write-double :%sndfile)
  (export '%sndfile::+format-dpcm-16+ :%sndfile)
  (export '%sndfile::+c-calc-norm-signal-max+ :%sndfile)
  (export '%sndfile::+channel-map-mono+ :%sndfile)
  (export '%sndfile::info :%sndfile)
  (export '%sndfile::+str-genre+ :%sndfile)
  (export '%sndfile::open-fd :%sndfile)
  (export '%sndfile::cut-id :%sndfile)
  (export '%sndfile::time-sig-den :%sndfile)
  (export '%sndfile::extension :%sndfile)
  (export '%sndfile::+channel-map-top-rear-left+ :%sndfile)
  (export '%sndfile::+false+ :%sndfile)
  (export '%sndfile::+c-calc-max-all-channels+ :%sndfile)
  (export '%sndfile::sndfile :%sndfile)
  (export '%sndfile::+format-dwvw-16+ :%sndfile)
  (export '%sndfile::+format-raw+ :%sndfile)
  (export '%sndfile::+format-mat5+ :%sndfile)
  (export '%sndfile::embed-file-info :%sndfile)
  (export '%sndfile::|C:@SA@SF-FORMAT-INFO| :%sndfile)
  (export '%sndfile::perror :%sndfile)
  (export '%sndfile::classification :%sndfile)
  (export '%sndfile::int32-t :%sndfile)
  (export '%sndfile::+str-software+ :%sndfile)
  (export '%sndfile::+c-set-original-samplerate+ :%sndfile)
  (export '%sndfile::+m-rdwr+ :%sndfile)
  (export '%sndfile::cue-points :%sndfile)
  (export '%sndfile::+str-first+ :%sndfile)
  (export '%sndfile::+format-mat4+ :%sndfile)
  (export '%sndfile::loudness-range :%sndfile)
  (export '%sndfile::+channel-map-top-front-left+ :%sndfile)
  (export '%sndfile::version-string :%sndfile)
  (export '%sndfile::+err-system+ :%sndfile)
  (export '%sndfile::+format-g721-32+ :%sndfile)
  (export '%sndfile::artist :%sndfile)
  (export '%sndfile::+str-last+ :%sndfile)
  (export '%sndfile::+m-write+ :%sndfile)
  (export '%sndfile::error :%sndfile)
  (export '%sndfile::+c-get-log-info+ :%sndfile)
  (export '%sndfile::|C:@SA@SF-INSTRUMENT@S@SNDFILE.H@14463|
          :%sndfile)
  (export '%sndfile::loop-count :%sndfile)
  (export '%sndfile::+format-caf+ :%sndfile)
  (export '%sndfile::+channel-map-ambisonic-b-x+ :%sndfile)
  (export '%sndfile::read-float :%sndfile)
  (export '%sndfile::+format-dwvw-n+ :%sndfile)
  (export '%sndfile::out-cue :%sndfile)
  (export '%sndfile::+seek-set+ :%sndfile)
  (export '%sndfile::+c-get-loop-info+ :%sndfile)
  (export '%sndfile::write-raw :%sndfile)
  (export '%sndfile::start-time :%sndfile)
  (export '%sndfile::+channel-map-top-rear-right+ :%sndfile)
  (export '%sndfile::|C:@SA@SF-BROADCAST-INFO| :%sndfile)
  (export '%sndfile::client-id :%sndfile)
  (export '%sndfile::+c-wavex-set-ambisonic+ :%sndfile)
  (export '%sndfile::+c-set-compression-level+ :%sndfile)
  (export '%sndfile::originator :%sndfile)
  (export '%sndfile::+format-wavex+ :%sndfile)
  (export '%sndfile::get-chunk-size :%sndfile)
  (export '%sndfile::+count-max+ :%sndfile)
  (export '%sndfile::+c-set-clipping+ :%sndfile)
  (export '%sndfile::offset :%sndfile)
  (export '%sndfile::open-virtual :%sndfile)
  (export '%sndfile::write-int :%sndfile)
  (export '%sndfile::+endian-big+ :%sndfile)
  (export '%sndfile::+format-nms-adpcm-32+ :%sndfile)
  (export '%sndfile::+channel-map-top-center+ :%sndfile)
  (export '%sndfile::|C:@SA@SF-EMBED-FILE-INFO| :%sndfile)
  (export '%sndfile::type :%sndfile)
  (export '%sndfile::+str-artist+ :%sndfile)
  (export '%sndfile::size-t :%sndfile)
  (export '%sndfile::+channel-map-ambisonic-b-y+ :%sndfile)
  (export '%sndfile::+channel-map-front-left+ :%sndfile)
  (export '%sndfile::origination-date :%sndfile)
  (export '%sndfile::+c-get-format-major+ :%sndfile)
  (export '%sndfile::cart-timer :%sndfile)
  (export '%sndfile::+format-alac-20+ :%sndfile)
  (export '%sndfile::+d-white+ :%sndfile)
  (export '%sndfile::close :%sndfile)
  (export '%sndfile::+format-alaw+ :%sndfile)
  (export '%sndfile::+format-gsm610+ :%sndfile)
  (export '%sndfile::+c-set-raw-start-offset+ :%sndfile)
  (export '%sndfile::+c-set-vbr-encoding-quality+ :%sndfile)
  (export '%sndfile::coding-history-size :%sndfile)
  (export '%sndfile::+channel-map-front-right+ :%sndfile)
  (export '%sndfile::+channel-map-top-front-center+ :%sndfile)
  (export '%sndfile::set-chunk :%sndfile)
  (export '%sndfile::+seek-end+ :%sndfile)
  (export '%sndfile::+format-au+ :%sndfile)
  (export '%sndfile::end-date :%sndfile)
  (export '%sndfile::read-double :%sndfile)
  (export '%sndfile::+m-read+ :%sndfile)
  (export '%sndfile::read-short :%sndfile)
  (export '%sndfile::+format-dpcm-8+ :%sndfile)
  (export '%sndfile::umid :%sndfile)
  (export '%sndfile::basenote :%sndfile)
  (export '%sndfile::id-size :%sndfile)
  (export '%sndfile::cart-info :%sndfile)
  (export '%sndfile::+format-flac+ :%sndfile)
  (export '%sndfile::+c-set-scale-int-float-write+ :%sndfile)
  (export '%sndfile::+channel-map-invalid+ :%sndfile)
  (export '%sndfile::read-int :%sndfile)
  (export '%sndfile::samplerate :%sndfile)
  (export '%sndfile::cue-count :%sndfile)
  (export '%sndfile::+endian-little+ :%sndfile)
  (export '%sndfile::+c-get-norm-float+ :%sndfile)
  (export '%sndfile::+c-get-format-info+ :%sndfile)
  (export '%sndfile::channels :%sndfile)
  (export '%sndfile::data :%sndfile)
  (export '%sndfile::max-momentary-loudness :%sndfile)
  (export '%sndfile::end-time :%sndfile)
  (export '%sndfile::num-beats :%sndfile)
  (export '%sndfile::+c-raw-data-needs-endswap+ :%sndfile)
  (export '%sndfile::+channel-map-top-front-right+ :%sndfile)
  (export '%sndfile::+c-get-lib-version+ :%sndfile)
  (export '%sndfile::version :%sndfile)
  (export '%sndfile::+c-set-instrument+ :%sndfile)
  (export '%sndfile::current-byterate :%sndfile)
  (export '%sndfile::vio-tell :%sndfile)
  (export '%sndfile::get-chunk-data :%sndfile)
  (export '%sndfile::key-lo :%sndfile)
  (export '%sndfile::+loop-backward+ :%sndfile)
  (export '%sndfile::+loop-alternating+ :%sndfile)
  (export '%sndfile::producer-app-id :%sndfile)
  (export '%sndfile::+format-nms-adpcm-16+ :%sndfile)
  (export '%sndfile::+err-no-error+ :%sndfile)
  (export '%sndfile::+format-pcm-16+ :%sndfile)
  (export '%sndfile::+str-album+ :%sndfile)
  (export '%sndfile::+format-submask+ :%sndfile)
  (export '%sndfile::read-raw :%sndfile)
  (export '%sndfile::+c-get-original-samplerate+ :%sndfile)
  (export '%sndfile::+c-set-broadcast-info+ :%sndfile)
  (export '%sndfile::id :%sndfile)
  (export '%sndfile::+format-nist+ :%sndfile)
  (export '%sndfile::+true+ :%sndfile)
  (export '%sndfile::read :%sndfile)
  (export '%sndfile::writef-short :%sndfile)
  (export '%sndfile::|C:@SA@SF-CART-INFO| :%sndfile)
  (export '%sndfile::+format-g723-24+ :%sndfile)
  (export '%sndfile::+format-typemask+ :%sndfile)
  (export '%sndfile::+format-ogg+ :%sndfile)
  (export '%sndfile::+format-mpc2k+ :%sndfile)
  (export '%sndfile::+c-get-simple-format+ :%sndfile)
  (export '%sndfile::+d-default-level+ :%sndfile)
  (export '%sndfile::+seek-cur+ :%sndfile)
  (export '%sndfile::write-short :%sndfile)
  (export '%sndfile::+channel-map-lfe+ :%sndfile)
  (export '%sndfile::sndfile-tag :%sndfile)
  (export '%sndfile::+format-ulaw+ :%sndfile)
  (export '%sndfile::dither-info :%sndfile)
  (export '%sndfile::open :%sndfile)
  (export '%sndfile::get-filelen :%sndfile)
  (export '%sndfile::+c-get-signal-max+ :%sndfile)
  (export '%sndfile::tag-text :%sndfile)
  (export '%sndfile::loudness-value :%sndfile)
  (export '%sndfile::+str-date+ :%sndfile)
  (export '%sndfile::velocity-hi :%sndfile)
  (export '%sndfile::chunk-start :%sndfile)
  (export '%sndfile::+format-w64+ :%sndfile)
  (export '%sndfile::int16-t :%sndfile)
  (export '%sndfile::+c-set-dither-on-write+ :%sndfile)
  (export '%sndfile::+format-wav+ :%sndfile)
  (export '%sndfile::max-shortterm-loudness :%sndfile)
  (export '%sndfile::+c-get-clipping+ :%sndfile)
  (export '%sndfile::reserved :%sndfile)
  (export '%sndfile::+ambisonic-none+ :%sndfile)
  (export '%sndfile::start :%sndfile)
  (export '%sndfile::start-date :%sndfile)
  (export '%sndfile::+format-double+ :%sndfile)
  (export '%sndfile::+format-nms-adpcm-24+ :%sndfile)
  (export '%sndfile::+c-update-header-now+ :%sndfile)
  (export '%sndfile::usage :%sndfile)
  (export '%sndfile::origination-time :%sndfile)
  (export '%sndfile::cues :%sndfile)
  (export '%sndfile::url :%sndfile)
  (export '%sndfile::command :%sndfile)
  (export '%sndfile::+c-get-channel-map-info+ :%sndfile)
  (export '%sndfile::+c-get-broadcast-info+ :%sndfile)
  (export '%sndfile::+format-xi+ :%sndfile)
  (export '%sndfile::loop-mode :%sndfile)
  (export '%sndfile::category :%sndfile)
  (export '%sndfile::loops :%sndfile)
  (export '%sndfile::+err-unrecognised-format+ :%sndfile)
  (export '%sndfile::coding-history :%sndfile)
  (export '%sndfile::+channel-map-right+ :%sndfile)
  (export '%sndfile::+c-get-simple-format-count+ :%sndfile)
  (export '%sndfile::bpm :%sndfile)
  (export '%sndfile::+str-comment+ :%sndfile)
  (export '%sndfile::readf-double :%sndfile)
  (export '%sndfile::+format-vox-adpcm+ :%sndfile)
  (export '%sndfile::+format-aiff+ :%sndfile)
  (export '%sndfile::+format-alac-24+ :%sndfile)
  (export '%sndfile::+channel-map-ambisonic-b-w+ :%sndfile)
  (export '%sndfile::+c-calc-norm-max-all-channels+ :%sndfile)
  (export '%sndfile::writef-float :%sndfile)
  (export '%sndfile::+endian-file+ :%sndfile)
  (export '%sndfile::+format-paf+ :%sndfile)
  (export '%sndfile::format-check :%sndfile)
  (export '%sndfile::+c-set-update-header-auto+ :%sndfile)
  (export '%sndfile::seek :%sndfile)
  (export '%sndfile::+c-set-dither-on-read+ :%sndfile)
  (export '%sndfile::+ambisonic-b-format+ :%sndfile)
  (export '%sndfile::|C:@SA@SF-CUE-POINT| :%sndfile)
  (export '%sndfile::+format-voc+ :%sndfile)
  (export '%sndfile::+c-get-cue-count+ :%sndfile)
  (export '%sndfile::+c-wavex-get-ambisonic+ :%sndfile)
  (export '%sndfile::value :%sndfile)
  (export '%sndfile::+c-get-format-subtype-count+ :%sndfile)
  (export '%sndfile::broadcast-info :%sndfile)
  (export '%sndfile::error-number :%sndfile)
  (export '%sndfile::+str-copyright+ :%sndfile)
  (export '%sndfile::+format-avr+ :%sndfile)
  (export '%sndfile::title :%sndfile)
  (export '%sndfile::datalen :%sndfile)
  (export '%sndfile::loop-info :%sndfile)
  (export '%sndfile::seekable :%sndfile)
  (export '%sndfile::|C:@SA@SF-LOOP-INFO| :%sndfile)
  (export '%sndfile::+loop-forward+ :%sndfile)
  (export '%sndfile::+str-tracknumber+ :%sndfile)
  (export '%sndfile::+channel-map-left+ :%sndfile)
  (export '%sndfile::+channel-map-center+ :%sndfile)
  (export '%sndfile::+c-calc-signal-max+ :%sndfile)
  (export '%sndfile::error-str :%sndfile)
  (export '%sndfile::level-reference :%sndfile)
  (export '%sndfile::+format-ima-adpcm+ :%sndfile)
  (export '%sndfile::+c-set-add-header-pad-chunk+ :%sndfile)
  (export '%sndfile::fcc-chunk :%sndfile)
  (export '%sndfile::+c-rf64-auto-downgrade+ :%sndfile)
  (export '%sndfile::+c-set-norm-float+ :%sndfile)
  (export '%sndfile::end :%sndfile)
  (export '%sndfile::post-timers :%sndfile)
  (export '%sndfile::+format-float+ :%sndfile))

