#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone tclreadline https://github.com/flightaware/tclreadline.git

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /work/tclreadline && autoreconf -vi && ./configure --with-tk=no && make && make install

build_cleanup
