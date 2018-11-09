#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tclreadline ]; then
	cd /work && sh /builds/download-tclreadline.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /work/tclreadline && autoreconf -vi && ./configure --with-tk=no && make && make install

build_cleanup

