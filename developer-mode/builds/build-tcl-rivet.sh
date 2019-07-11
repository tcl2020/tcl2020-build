#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcl-rivet ]; then
	cd /workspaces && sh /builds/download-tcl-rivet.sh
fi

cd /workspaces/tcl-rivet || exit 1
autoreconf -vi && ./configure && make && make install

build_cleanup

