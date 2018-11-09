#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tcllauncher ]; then
	cd /work && sh /builds/download-tcllauncher.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /work/tcllauncher && autoreconf -vi && ./configure && make && make install

build_cleanup

