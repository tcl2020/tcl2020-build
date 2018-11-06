#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone tclbsd https://github.com/flightaware/tclbsd.git

cd /work/tclbsd
autoreconf -vi && ./configure && make && make install

build_cleanup

