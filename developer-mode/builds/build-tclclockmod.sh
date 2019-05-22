#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclclockmod ]; then
	cd /workspaces && sh /builds/download-tclclockmod.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /workspaces/tclclockmod && autoreconf -vi && ./configure && make && make install

build_cleanup
