[![Build Status](https://travis-ci.org/borodust/bodge-sndfile.svg)](https://travis-ci.org/borodust/bodge-sndfile) [![Build status](https://ci.appveyor.com/api/projects/status/5h2no6lt255dk0pe?svg=true)](https://ci.appveyor.com/project/borodust/bodge-sndfile)


# BODGE-SNDFILE

Thin Common Lisp wrapper over [`libsndfile`](http://www.mega-nerd.com/libsndfile/)
cross-platform library for reading and writing files containing sampled sound.

# Requirements

* ASDF/Quicklisp
* x86_64/i686 GNU/Linux, macOS or Windows


# Loading
```lisp
(ql:quickload '(sndfile-blob bodge-sndfile))
```

# Usage

### Interface
All wrapped functions can be found in `%sf` package. On the other hand, a bit more lispified
functionality reside in `sf` package.


# Example
Common Lisp example of `bodge-sndfile` usage can be found in [`example.lisp`](example.lisp)

To run it, evaluate in your REPL:
```lisp
(ql:quickload :bodge-sndfile/example)
;; for metadata printing
(sndfile.example:run)
;; for getting samples out of the example .ogg file
(sndfile.example:decode)
```
