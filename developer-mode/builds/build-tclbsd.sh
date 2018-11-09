#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tclbsd ]; then
	cd /work && sh /builds/download-tclbsd.sh
fi

cd /work/tclbsd || exit 1
autoreconf -vi && ./configure && make && make install

build_cleanup

