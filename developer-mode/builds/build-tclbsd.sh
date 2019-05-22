#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tclbsd ]; then
	cd /workspace && sh /builds/download-tclbsd.sh
fi

cd /workspace/tclbsd || exit 1
autoreconf -vi && ./configure && make && make install

build_cleanup

