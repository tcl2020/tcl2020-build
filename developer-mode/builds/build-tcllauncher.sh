#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tcllauncher ]; then
	cd /workspace && sh /builds/download-tcllauncher.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /workspace/tcllauncher && autoreconf -vi && ./configure && make && make install

build_cleanup

