#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/yajl-tcl ]; then
	cd /workspaces && sh /builds/download-yajl-tcl.sh
fi

cd /workspaces/yajl-tcl
autoreconf -vi && ./configure && make && make install

build_cleanup

