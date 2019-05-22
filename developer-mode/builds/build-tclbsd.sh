#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclbsd ]; then
	cd /workspaces && sh /builds/download-tclbsd.sh
fi

cd /workspaces/tclbsd || exit 1
autoreconf -vi && ./configure && make && make install

build_cleanup

