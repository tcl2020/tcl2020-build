#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tclclockmod ]; then
	cd /work && sh /builds/download-tclclockmod.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /work/tclclockmod && autoreconf -vi && ./configure && make && make install

build_cleanup
