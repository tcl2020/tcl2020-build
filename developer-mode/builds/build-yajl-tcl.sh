#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone yajl-tcl https://github.com/flightaware/yajl-tcl.git

cd /work/yajl-tcl
autoreconf -vi && ./configure && make && make install

build_cleanup

