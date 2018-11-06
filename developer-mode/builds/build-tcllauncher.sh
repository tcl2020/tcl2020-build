#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone tcllauncher https://github.com/flightaware/tcllauncher.git

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /work/tcllauncher && autoreconf -vi && ./configure && make && make install

build_cleanup
