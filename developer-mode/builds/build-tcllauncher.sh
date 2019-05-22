#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcllauncher ]; then
	cd /workspaces && sh /builds/download-tcllauncher.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /workspaces/tcllauncher && autoreconf -vi && ./configure && make && make install

build_cleanup

