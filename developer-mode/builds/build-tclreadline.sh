#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tclreadline ]; then
	cd /workspace && sh /builds/download-tclreadline.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /workspace/tclreadline && autoreconf -vi && ./configure --with-tk=no && make && make install

build_cleanup

