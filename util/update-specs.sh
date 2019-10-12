#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

lisp download-specs --lib-postfix ".bodged" \
     sndfile https://github.com/borodust/bodge-sndfile \
     "$script_dir/../src/spec/" $1
