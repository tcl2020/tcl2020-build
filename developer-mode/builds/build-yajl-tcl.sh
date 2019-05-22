#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/yajl-tcl ]; then
	cd /workspace && sh /builds/download-yajl-tcl.sh
fi

cd /workspace/yajl-tcl
autoreconf -vi && ./configure && make && make install

build_cleanup

