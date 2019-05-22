#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tclclockmod ]; then
	cd /workspace && sh /builds/download-tclclockmod.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /workspace/tclclockmod && autoreconf -vi && ./configure && make && make install

build_cleanup
