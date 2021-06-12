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
              (%sndfile::sndfile (:pointer %sndfile::sndfile)))

(declaim (inline %sndfile::command))

(cffi:defcfun ("sf_command" %sndfile::command)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::command :int)
              (%sndfile::data (:pointer :void))
              (%sndfile::datasize :int))

(declaim (inline %sndfile::current-byterate))

(cffi:defcfun ("sf_current_byterate" %sndfile::current-byterate)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile)))

(declaim (inline %sndfile::error))

(cffi:defcfun ("sf_error" %sndfile::error)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile)))

(declaim (inline %sndfile::error-number))

(cffi:defcfun ("sf_error_number" %sndfile::error-number)
              claw-utils:claw-string
              (%sndfile::errnum :int))

(cffi:defctype %sndfile::size-t :unsigned-long)

(declaim (inline %sndfile::error-str))

(cffi:defcfun ("sf_error_str" %sndfile::error-str)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
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
              (%sndfile::info (:pointer %sndfile::info)))

(cffi:defcstruct (%sndfile::chunk-iterator :size 0))

(cffi:defctype %sndfile::chunk-iterator
               (:struct %sndfile::chunk-iterator))

(cffi:defcstruct (%sndfile::chunk-info :size 80)
                 (%sndfile::id :char :count 64 :offset 0)
                 (%sndfile::id-size :unsigned-int :offset 64)
                 (%sndfile::datalen :unsigned-int :offset 68)
                 (%sndfile::data (:pointer :void) :offset 72))

(cffi:defctype %sndfile::chunk-info (:struct %sndfile::chunk-info))

(declaim (inline %sndfile::get-chunk-data))

(cffi:defcfun ("sf_get_chunk_data" %sndfile::get-chunk-data)
              :int
              (%sndfile::it (:pointer %sndfile::chunk-iterator))
              (%sndfile::chunk-info (:pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::get-chunk-iterator))

(cffi:defcfun ("sf_get_chunk_iterator" %sndfile::get-chunk-iterator)
              (:pointer %sndfile::chunk-iterator)
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::chunk-info (:pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::get-chunk-size))

(cffi:defcfun ("sf_get_chunk_size" %sndfile::get-chunk-size)
              :int
              (%sndfile::it (:pointer %sndfile::chunk-iterator))
              (%sndfile::chunk-info (:pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::get-string))

(cffi:defcfun ("sf_get_string" %sndfile::get-string)
              claw-utils:claw-string
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::str-type :int))

(declaim (inline %sndfile::next-chunk-iterator))

(cffi:defcfun ("sf_next_chunk_iterator"
               %sndfile::next-chunk-iterator)
              (:pointer %sndfile::chunk-iterator)
              (%sndfile::iterator
               (:pointer %sndfile::chunk-iterator)))

(declaim (inline %sndfile::open))

(cffi:defcfun ("sf_open" %sndfile::open)
              (:pointer %sndfile::sndfile)
              (%sndfile::path claw-utils:claw-string)
              (%sndfile::mode :int)
              (%sndfile::sfinfo (:pointer %sndfile::info)))

(declaim (inline %sndfile::open-fd))

(cffi:defcfun ("sf_open_fd" %sndfile::open-fd)
              (:pointer %sndfile::sndfile)
              (%sndfile::fd :int)
              (%sndfile::mode :int)
              (%sndfile::sfinfo (:pointer %sndfile::info))
              (%sndfile::close-desc :int))

(cffi:defctype %sndfile::vio-get-filelen (:pointer :void))

(cffi:defctype %sndfile::vio-seek (:pointer :void))

(cffi:defctype %sndfile::vio-read (:pointer :void))

(cffi:defctype %sndfile::vio-write (:pointer :void))

(cffi:defctype %sndfile::vio-tell (:pointer :void))

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
              (:pointer %sndfile::sndfile)
              (%sndfile::sfvirtual (:pointer %sndfile::virtual-io))
              (%sndfile::mode :int)
              (%sndfile::sfinfo (:pointer %sndfile::info))
              (%sndfile::user-data (:pointer :void)))

(declaim (inline %sndfile::perror))

(cffi:defcfun ("sf_perror" %sndfile::perror)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile)))

(declaim (inline %sndfile::read-double))

(cffi:defcfun ("sf_read_double" %sndfile::read-double)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :double))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::read-float))

(cffi:defcfun ("sf_read_float" %sndfile::read-float)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :float))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::read-int))

(cffi:defcfun ("sf_read_int" %sndfile::read-int)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :int))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::read-raw))

(cffi:defcfun ("sf_read_raw" %sndfile::read-raw)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :void))
              (%sndfile::bytes %sndfile::count-t))

(declaim (inline %sndfile::read-short))

(cffi:defcfun ("sf_read_short" %sndfile::read-short)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :short))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::readf-double))

(cffi:defcfun ("sf_readf_double" %sndfile::readf-double)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :double))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::readf-float))

(cffi:defcfun ("sf_readf_float" %sndfile::readf-float)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :float))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::readf-int))

(cffi:defcfun ("sf_readf_int" %sndfile::readf-int)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :int))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::readf-short))

(cffi:defcfun ("sf_readf_short" %sndfile::readf-short)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :short))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::seek))

(cffi:defcfun ("sf_seek" %sndfile::seek)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::frames %sndfile::count-t)
              (%sndfile::whence :int))

(declaim (inline %sndfile::set-chunk))

(cffi:defcfun ("sf_set_chunk" %sndfile::set-chunk)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::chunk-info (:pointer %sndfile::chunk-info)))

(declaim (inline %sndfile::set-string))

(cffi:defcfun ("sf_set_string" %sndfile::set-string)
              :int
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::str-type :int)
              (%sndfile::str claw-utils:claw-string))

(declaim (inline %sndfile::strerror))

(cffi:defcfun ("sf_strerror" %sndfile::strerror)
              claw-utils:claw-string
              (%sndfile::sndfile (:pointer %sndfile::sndfile)))

(declaim (inline %sndfile::version-string))

(cffi:defcfun ("sf_version_string" %sndfile::version-string)
              claw-utils:claw-string)

(declaim (inline %sndfile::write-double))

(cffi:defcfun ("sf_write_double" %sndfile::write-double)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :double))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-float))

(cffi:defcfun ("sf_write_float" %sndfile::write-float)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :float))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-int))

(cffi:defcfun ("sf_write_int" %sndfile::write-int)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :int))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-raw))

(cffi:defcfun ("sf_write_raw" %sndfile::write-raw)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :void))
              (%sndfile::bytes %sndfile::count-t))

(declaim (inline %sndfile::write-short))

(cffi:defcfun ("sf_write_short" %sndfile::write-short)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :short))
              (%sndfile::items %sndfile::count-t))

(declaim (inline %sndfile::write-sync))

(cffi:defcfun ("sf_write_sync" %sndfile::write-sync)
              :void
              (%sndfile::sndfile (:pointer %sndfile::sndfile)))

(declaim (inline %sndfile::writef-double))

(cffi:defcfun ("sf_writef_double" %sndfile::writef-double)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :double))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::writef-float))

(cffi:defcfun ("sf_writef_float" %sndfile::writef-float)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :float))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::writef-int))

(cffi:defcfun ("sf_writef_int" %sndfile::writef-int)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :int))
              (%sndfile::frames %sndfile::count-t))

(declaim (inline %sndfile::writef-short))

(cffi:defcfun ("sf_writef_short" %sndfile::writef-short)
              %sndfile::count-t
              (%sndfile::sndfile (:pointer %sndfile::sndfile))
              (%sndfile::ptr (:pointer :short))
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
  (export '%sndfile::+channel-map-front-left-of-center+ "%SNDFILE")
  (export '%sndfile::format-info "%SNDFILE")
  (export '%sndfile::+c-get-max-all-channels+ "%SNDFILE")
  (export '%sndfile::+format-pvf+ "%SNDFILE")
  (export '%sndfile::write "%SNDFILE")
  (export '%sndfile::+c-set-cart-info+ "%SNDFILE")
  (export '%sndfile::+c-get-current-sf-info+ "%SNDFILE")
  (export '%sndfile::+channel-map-side-right+ "%SNDFILE")
  (export '%sndfile::+c-get-instrument+ "%SNDFILE")
  (export '%sndfile::tag-text-size "%SNDFILE")
  (export '%sndfile::max-true-peak-level "%SNDFILE")
  (export '%sndfile::+c-get-norm-double+ "%SNDFILE")
  (export '%sndfile::+c-get-embed-file-info+ "%SNDFILE")
  (export '%sndfile::set-string "%SNDFILE")
  (export '%sndfile::+format-rf64+ "%SNDFILE")
  (export '%sndfile::vio-get-filelen "%SNDFILE")
  (export '%sndfile::+format-opus+ "%SNDFILE")
  (export '%sndfile::+c-get-format-subtype+ "%SNDFILE")
  (export '%sndfile::vio-read "%SNDFILE")
  (export '%sndfile::+d-triangular-pdf+ "%SNDFILE")
  (export '%sndfile::chunk-info "%SNDFILE")
  (export '%sndfile::+c-set-cue+ "%SNDFILE")
  (export '%sndfile::+err-unsupported-encoding+ "%SNDFILE")
  (export '%sndfile::time-sig-num "%SNDFILE")
  (export '%sndfile::+c-set-scale-float-int-read+ "%SNDFILE")
  (export '%sndfile::+loop-none+ "%SNDFILE")
  (export '%sndfile::+format-g723-40+ "%SNDFILE")
  (export '%sndfile::+channel-map-ambisonic-b-z+ "%SNDFILE")
  (export '%sndfile::+c-set-add-peak-chunk+ "%SNDFILE")
  (export '%sndfile::+c-get-dither-info+ "%SNDFILE")
  (export '%sndfile::readf-float "%SNDFILE")
  (export '%sndfile::+err-malformed-file+ "%SNDFILE")
  (export '%sndfile::+format-pcm-s8+ "%SNDFILE")
  (export '%sndfile::+d-custom-level+ "%SNDFILE")
  (export '%sndfile::count "%SNDFILE")
  (export '%sndfile::+c-set-add-dither-on-write+ "%SNDFILE")
  (export '%sndfile::frames "%SNDFILE")
  (export '%sndfile::+c-test-ieee-float-replace+ "%SNDFILE")
  (export '%sndfile::+channel-map-front-right-of-center+ "%SNDFILE")
  (export '%sndfile::strerror "%SNDFILE")
  (export '%sndfile::+endian-cpu+ "%SNDFILE")
  (export '%sndfile::+format-svx+ "%SNDFILE")
  (export '%sndfile::+format-sds+ "%SNDFILE")
  (export '%sndfile::+channel-map-top-rear-center+ "%SNDFILE")
  (export '%sndfile::+str-title+ "%SNDFILE")
  (export '%sndfile::+channel-map-side-left+ "%SNDFILE")
  (export '%sndfile::+format-alac-32+ "%SNDFILE")
  (export '%sndfile::+c-set-channel-map-info+ "%SNDFILE")
  (export '%sndfile::+channel-map-rear-left+ "%SNDFILE")
  (export '%sndfile::get-string "%SNDFILE")
  (export '%sndfile::+str-license+ "%SNDFILE")
  (export '%sndfile::block-start "%SNDFILE")
  (export '%sndfile::+format-sd2+ "%SNDFILE")
  (export '%sndfile::+c-get-format-major-count+ "%SNDFILE")
  (export '%sndfile::+format-pcm-32+ "%SNDFILE")
  (export '%sndfile::+c-get-cart-info+ "%SNDFILE")
  (export '%sndfile::indx "%SNDFILE")
  (export '%sndfile::user-def "%SNDFILE")
  (export '%sndfile::sections "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-CUES| "%SNDFILE")
  (export '%sndfile::count-t "%SNDFILE")
  (export '%sndfile::+channel-map-front-center+ "%SNDFILE")
  (export '%sndfile::+format-endmask+ "%SNDFILE")
  (export '%sndfile::get-chunk-iterator "%SNDFILE")
  (export '%sndfile::readf-int "%SNDFILE")
  (export '%sndfile::name "%SNDFILE")
  (export '%sndfile::position "%SNDFILE")
  (export '%sndfile::writef-int "%SNDFILE")
  (export '%sndfile::vio-write "%SNDFILE")
  (export '%sndfile::writef-double "%SNDFILE")
  (export '%sndfile::+format-dwvw-12+ "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-INSTRUMENT| "%SNDFILE")
  (export '%sndfile::gain "%SNDFILE")
  (export '%sndfile::+format-pcm-24+ "%SNDFILE")
  (export '%sndfile::+channel-map-max+ "%SNDFILE")
  (export '%sndfile::+channel-map-rear-center+ "%SNDFILE")
  (export '%sndfile::+c-file-truncate+ "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-DITHER-INFO| "%SNDFILE")
  (export '%sndfile::mode "%SNDFILE")
  (export '%sndfile::+c-get-dither-info-count+ "%SNDFILE")
  (export '%sndfile::time-reference-low "%SNDFILE")
  (export '%sndfile::detune "%SNDFILE")
  (export '%sndfile::root-key "%SNDFILE")
  (export '%sndfile::+format-vorbis+ "%SNDFILE")
  (export '%sndfile::+format-pcm-u8+ "%SNDFILE")
  (export '%sndfile::uint32-t "%SNDFILE")
  (export '%sndfile::cue-point "%SNDFILE")
  (export '%sndfile::+format-ircam+ "%SNDFILE")
  (export '%sndfile::+d-no-dither+ "%SNDFILE")
  (export '%sndfile::+format-htk+ "%SNDFILE")
  (export '%sndfile::+channel-map-rear-right+ "%SNDFILE")
  (export '%sndfile::time-reference-high "%SNDFILE")
  (export '%sndfile::+format-dwvw-24+ "%SNDFILE")
  (export '%sndfile::chunk-iterator "%SNDFILE")
  (export '%sndfile::virtual-io "%SNDFILE")
  (export '%sndfile::originator-reference "%SNDFILE")
  (export '%sndfile::sample-offset "%SNDFILE")
  (export '%sndfile::readf-short "%SNDFILE")
  (export '%sndfile::format "%SNDFILE")
  (export '%sndfile::velocity-lo "%SNDFILE")
  (export '%sndfile::level "%SNDFILE")
  (export '%sndfile::vio-seek "%SNDFILE")
  (export '%sndfile::instrument "%SNDFILE")
  (export '%sndfile::next-chunk-iterator "%SNDFILE")
  (export '%sndfile::+c-get-cue+ "%SNDFILE")
  (export '%sndfile::+format-ms-adpcm+ "%SNDFILE")
  (export '%sndfile::length "%SNDFILE")
  (export '%sndfile::write-sync "%SNDFILE")
  (export '%sndfile::future "%SNDFILE")
  (export '%sndfile::+format-alac-16+ "%SNDFILE")
  (export '%sndfile::write-float "%SNDFILE")
  (export '%sndfile::+format-wve+ "%SNDFILE")
  (export '%sndfile::+c-set-add-dither-on-read+ "%SNDFILE")
  (export '%sndfile::tell "%SNDFILE")
  (export '%sndfile::description "%SNDFILE")
  (export '%sndfile::producer-app-version "%SNDFILE")
  (export '%sndfile::key-hi "%SNDFILE")
  (export '%sndfile::+c-set-norm-double+ "%SNDFILE")
  (export '%sndfile::write-double "%SNDFILE")
  (export '%sndfile::+format-dpcm-16+ "%SNDFILE")
  (export '%sndfile::+c-calc-norm-signal-max+ "%SNDFILE")
  (export '%sndfile::+channel-map-mono+ "%SNDFILE")
  (export '%sndfile::info "%SNDFILE")
  (export '%sndfile::+str-genre+ "%SNDFILE")
  (export '%sndfile::open-fd "%SNDFILE")
  (export '%sndfile::cut-id "%SNDFILE")
  (export '%sndfile::time-sig-den "%SNDFILE")
  (export '%sndfile::extension "%SNDFILE")
  (export '%sndfile::+channel-map-top-rear-left+ "%SNDFILE")
  (export '%sndfile::+false+ "%SNDFILE")
  (export '%sndfile::+c-calc-max-all-channels+ "%SNDFILE")
  (export '%sndfile::sndfile "%SNDFILE")
  (export '%sndfile::+format-dwvw-16+ "%SNDFILE")
  (export '%sndfile::+format-raw+ "%SNDFILE")
  (export '%sndfile::+format-mat5+ "%SNDFILE")
  (export '%sndfile::embed-file-info "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-FORMAT-INFO| "%SNDFILE")
  (export '%sndfile::perror "%SNDFILE")
  (export '%sndfile::classification "%SNDFILE")
  (export '%sndfile::int32-t "%SNDFILE")
  (export '%sndfile::+str-software+ "%SNDFILE")
  (export '%sndfile::+c-set-original-samplerate+ "%SNDFILE")
  (export '%sndfile::+m-rdwr+ "%SNDFILE")
  (export '%sndfile::cue-points "%SNDFILE")
  (export '%sndfile::+str-first+ "%SNDFILE")
  (export '%sndfile::+format-mat4+ "%SNDFILE")
  (export '%sndfile::loudness-range "%SNDFILE")
  (export '%sndfile::+channel-map-top-front-left+ "%SNDFILE")
  (export '%sndfile::version-string "%SNDFILE")
  (export '%sndfile::+err-system+ "%SNDFILE")
  (export '%sndfile::+format-g721-32+ "%SNDFILE")
  (export '%sndfile::artist "%SNDFILE")
  (export '%sndfile::+str-last+ "%SNDFILE")
  (export '%sndfile::+m-write+ "%SNDFILE")
  (export '%sndfile::error "%SNDFILE")
  (export '%sndfile::+c-get-log-info+ "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-INSTRUMENT@S@SNDFILE.H@14463|
          "%SNDFILE")
  (export '%sndfile::loop-count "%SNDFILE")
  (export '%sndfile::+format-caf+ "%SNDFILE")
  (export '%sndfile::+channel-map-ambisonic-b-x+ "%SNDFILE")
  (export '%sndfile::read-float "%SNDFILE")
  (export '%sndfile::+format-dwvw-n+ "%SNDFILE")
  (export '%sndfile::out-cue "%SNDFILE")
  (export '%sndfile::+seek-set+ "%SNDFILE")
  (export '%sndfile::+c-get-loop-info+ "%SNDFILE")
  (export '%sndfile::write-raw "%SNDFILE")
  (export '%sndfile::start-time "%SNDFILE")
  (export '%sndfile::+channel-map-top-rear-right+ "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-BROADCAST-INFO| "%SNDFILE")
  (export '%sndfile::client-id "%SNDFILE")
  (export '%sndfile::+c-wavex-set-ambisonic+ "%SNDFILE")
  (export '%sndfile::+c-set-compression-level+ "%SNDFILE")
  (export '%sndfile::originator "%SNDFILE")
  (export '%sndfile::+format-wavex+ "%SNDFILE")
  (export '%sndfile::get-chunk-size "%SNDFILE")
  (export '%sndfile::+count-max+ "%SNDFILE")
  (export '%sndfile::+c-set-clipping+ "%SNDFILE")
  (export '%sndfile::offset "%SNDFILE")
  (export '%sndfile::open-virtual "%SNDFILE")
  (export '%sndfile::write-int "%SNDFILE")
  (export '%sndfile::+endian-big+ "%SNDFILE")
  (export '%sndfile::+format-nms-adpcm-32+ "%SNDFILE")
  (export '%sndfile::+channel-map-top-center+ "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-EMBED-FILE-INFO| "%SNDFILE")
  (export '%sndfile::type "%SNDFILE")
  (export '%sndfile::+str-artist+ "%SNDFILE")
  (export '%sndfile::size-t "%SNDFILE")
  (export '%sndfile::+channel-map-ambisonic-b-y+ "%SNDFILE")
  (export '%sndfile::+channel-map-front-left+ "%SNDFILE")
  (export '%sndfile::origination-date "%SNDFILE")
  (export '%sndfile::+c-get-format-major+ "%SNDFILE")
  (export '%sndfile::cart-timer "%SNDFILE")
  (export '%sndfile::+format-alac-20+ "%SNDFILE")
  (export '%sndfile::+d-white+ "%SNDFILE")
  (export '%sndfile::close "%SNDFILE")
  (export '%sndfile::+format-alaw+ "%SNDFILE")
  (export '%sndfile::+format-gsm610+ "%SNDFILE")
  (export '%sndfile::+c-set-raw-start-offset+ "%SNDFILE")
  (export '%sndfile::+c-set-vbr-encoding-quality+ "%SNDFILE")
  (export '%sndfile::coding-history-size "%SNDFILE")
  (export '%sndfile::+channel-map-front-right+ "%SNDFILE")
  (export '%sndfile::+channel-map-top-front-center+ "%SNDFILE")
  (export '%sndfile::set-chunk "%SNDFILE")
  (export '%sndfile::+seek-end+ "%SNDFILE")
  (export '%sndfile::+format-au+ "%SNDFILE")
  (export '%sndfile::end-date "%SNDFILE")
  (export '%sndfile::read-double "%SNDFILE")
  (export '%sndfile::+m-read+ "%SNDFILE")
  (export '%sndfile::read-short "%SNDFILE")
  (export '%sndfile::+format-dpcm-8+ "%SNDFILE")
  (export '%sndfile::umid "%SNDFILE")
  (export '%sndfile::basenote "%SNDFILE")
  (export '%sndfile::id-size "%SNDFILE")
  (export '%sndfile::cart-info "%SNDFILE")
  (export '%sndfile::+format-flac+ "%SNDFILE")
  (export '%sndfile::+c-set-scale-int-float-write+ "%SNDFILE")
  (export '%sndfile::+channel-map-invalid+ "%SNDFILE")
  (export '%sndfile::read-int "%SNDFILE")
  (export '%sndfile::samplerate "%SNDFILE")
  (export '%sndfile::cue-count "%SNDFILE")
  (export '%sndfile::+endian-little+ "%SNDFILE")
  (export '%sndfile::+c-get-norm-float+ "%SNDFILE")
  (export '%sndfile::+c-get-format-info+ "%SNDFILE")
  (export '%sndfile::channels "%SNDFILE")
  (export '%sndfile::data "%SNDFILE")
  (export '%sndfile::max-momentary-loudness "%SNDFILE")
  (export '%sndfile::end-time "%SNDFILE")
  (export '%sndfile::num-beats "%SNDFILE")
  (export '%sndfile::+c-raw-data-needs-endswap+ "%SNDFILE")
  (export '%sndfile::+channel-map-top-front-right+ "%SNDFILE")
  (export '%sndfile::+c-get-lib-version+ "%SNDFILE")
  (export '%sndfile::version "%SNDFILE")
  (export '%sndfile::+c-set-instrument+ "%SNDFILE")
  (export '%sndfile::current-byterate "%SNDFILE")
  (export '%sndfile::vio-tell "%SNDFILE")
  (export '%sndfile::get-chunk-data "%SNDFILE")
  (export '%sndfile::key-lo "%SNDFILE")
  (export '%sndfile::+loop-backward+ "%SNDFILE")
  (export '%sndfile::+loop-alternating+ "%SNDFILE")
  (export '%sndfile::producer-app-id "%SNDFILE")
  (export '%sndfile::+format-nms-adpcm-16+ "%SNDFILE")
  (export '%sndfile::+err-no-error+ "%SNDFILE")
  (export '%sndfile::+format-pcm-16+ "%SNDFILE")
  (export '%sndfile::+str-album+ "%SNDFILE")
  (export '%sndfile::+format-submask+ "%SNDFILE")
  (export '%sndfile::read-raw "%SNDFILE")
  (export '%sndfile::+c-get-original-samplerate+ "%SNDFILE")
  (export '%sndfile::+c-set-broadcast-info+ "%SNDFILE")
  (export '%sndfile::id "%SNDFILE")
  (export '%sndfile::+format-nist+ "%SNDFILE")
  (export '%sndfile::+true+ "%SNDFILE")
  (export '%sndfile::read "%SNDFILE")
  (export '%sndfile::writef-short "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-CART-INFO| "%SNDFILE")
  (export '%sndfile::+format-g723-24+ "%SNDFILE")
  (export '%sndfile::+format-typemask+ "%SNDFILE")
  (export '%sndfile::+format-ogg+ "%SNDFILE")
  (export '%sndfile::+format-mpc2k+ "%SNDFILE")
  (export '%sndfile::+c-get-simple-format+ "%SNDFILE")
  (export '%sndfile::+d-default-level+ "%SNDFILE")
  (export '%sndfile::+seek-cur+ "%SNDFILE")
  (export '%sndfile::write-short "%SNDFILE")
  (export '%sndfile::+channel-map-lfe+ "%SNDFILE")
  (export '%sndfile::sndfile-tag "%SNDFILE")
  (export '%sndfile::+format-ulaw+ "%SNDFILE")
  (export '%sndfile::dither-info "%SNDFILE")
  (export '%sndfile::open "%SNDFILE")
  (export '%sndfile::get-filelen "%SNDFILE")
  (export '%sndfile::+c-get-signal-max+ "%SNDFILE")
  (export '%sndfile::tag-text "%SNDFILE")
  (export '%sndfile::loudness-value "%SNDFILE")
  (export '%sndfile::+str-date+ "%SNDFILE")
  (export '%sndfile::velocity-hi "%SNDFILE")
  (export '%sndfile::chunk-start "%SNDFILE")
  (export '%sndfile::+format-w64+ "%SNDFILE")
  (export '%sndfile::int16-t "%SNDFILE")
  (export '%sndfile::+c-set-dither-on-write+ "%SNDFILE")
  (export '%sndfile::+format-wav+ "%SNDFILE")
  (export '%sndfile::max-shortterm-loudness "%SNDFILE")
  (export '%sndfile::+c-get-clipping+ "%SNDFILE")
  (export '%sndfile::reserved "%SNDFILE")
  (export '%sndfile::+ambisonic-none+ "%SNDFILE")
  (export '%sndfile::start "%SNDFILE")
  (export '%sndfile::start-date "%SNDFILE")
  (export '%sndfile::+format-double+ "%SNDFILE")
  (export '%sndfile::+format-nms-adpcm-24+ "%SNDFILE")
  (export '%sndfile::+c-update-header-now+ "%SNDFILE")
  (export '%sndfile::usage "%SNDFILE")
  (export '%sndfile::origination-time "%SNDFILE")
  (export '%sndfile::cues "%SNDFILE")
  (export '%sndfile::url "%SNDFILE")
  (export '%sndfile::command "%SNDFILE")
  (export '%sndfile::+c-get-channel-map-info+ "%SNDFILE")
  (export '%sndfile::+c-get-broadcast-info+ "%SNDFILE")
  (export '%sndfile::+format-xi+ "%SNDFILE")
  (export '%sndfile::loop-mode "%SNDFILE")
  (export '%sndfile::category "%SNDFILE")
  (export '%sndfile::loops "%SNDFILE")
  (export '%sndfile::+err-unrecognised-format+ "%SNDFILE")
  (export '%sndfile::coding-history "%SNDFILE")
  (export '%sndfile::+channel-map-right+ "%SNDFILE")
  (export '%sndfile::+c-get-simple-format-count+ "%SNDFILE")
  (export '%sndfile::bpm "%SNDFILE")
  (export '%sndfile::+str-comment+ "%SNDFILE")
  (export '%sndfile::readf-double "%SNDFILE")
  (export '%sndfile::+format-vox-adpcm+ "%SNDFILE")
  (export '%sndfile::+format-aiff+ "%SNDFILE")
  (export '%sndfile::+format-alac-24+ "%SNDFILE")
  (export '%sndfile::+channel-map-ambisonic-b-w+ "%SNDFILE")
  (export '%sndfile::+c-calc-norm-max-all-channels+ "%SNDFILE")
  (export '%sndfile::writef-float "%SNDFILE")
  (export '%sndfile::+endian-file+ "%SNDFILE")
  (export '%sndfile::+format-paf+ "%SNDFILE")
  (export '%sndfile::format-check "%SNDFILE")
  (export '%sndfile::+c-set-update-header-auto+ "%SNDFILE")
  (export '%sndfile::seek "%SNDFILE")
  (export '%sndfile::+c-set-dither-on-read+ "%SNDFILE")
  (export '%sndfile::+ambisonic-b-format+ "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-CUE-POINT| "%SNDFILE")
  (export '%sndfile::+format-voc+ "%SNDFILE")
  (export '%sndfile::+c-get-cue-count+ "%SNDFILE")
  (export '%sndfile::+c-wavex-get-ambisonic+ "%SNDFILE")
  (export '%sndfile::value "%SNDFILE")
  (export '%sndfile::+c-get-format-subtype-count+ "%SNDFILE")
  (export '%sndfile::broadcast-info "%SNDFILE")
  (export '%sndfile::error-number "%SNDFILE")
  (export '%sndfile::+str-copyright+ "%SNDFILE")
  (export '%sndfile::+format-avr+ "%SNDFILE")
  (export '%sndfile::title "%SNDFILE")
  (export '%sndfile::datalen "%SNDFILE")
  (export '%sndfile::loop-info "%SNDFILE")
  (export '%sndfile::seekable "%SNDFILE")
  (export '%sndfile::|C:@SA@SF-LOOP-INFO| "%SNDFILE")
  (export '%sndfile::+loop-forward+ "%SNDFILE")
  (export '%sndfile::+str-tracknumber+ "%SNDFILE")
  (export '%sndfile::+channel-map-left+ "%SNDFILE")
  (export '%sndfile::+channel-map-center+ "%SNDFILE")
  (export '%sndfile::+c-calc-signal-max+ "%SNDFILE")
  (export '%sndfile::error-str "%SNDFILE")
  (export '%sndfile::level-reference "%SNDFILE")
  (export '%sndfile::+format-ima-adpcm+ "%SNDFILE")
  (export '%sndfile::+c-set-add-header-pad-chunk+ "%SNDFILE")
  (export '%sndfile::fcc-chunk "%SNDFILE")
  (export '%sndfile::+c-rf64-auto-downgrade+ "%SNDFILE")
  (export '%sndfile::+c-set-norm-float+ "%SNDFILE")
  (export '%sndfile::end "%SNDFILE")
  (export '%sndfile::post-timers "%SNDFILE")
  (export '%sndfile::+format-float+ "%SNDFILE"))

