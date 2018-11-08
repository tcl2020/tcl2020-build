#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/yajl-tcl ]; then
	cd /work && sh /builds/download-yajl-tcl.sh
fi

cd /work/yajl-tcl
autoreconf -vi && ./configure && make && make install

build_cleanup

