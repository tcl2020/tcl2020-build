#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/speedbag ]; then
	cd /work && sh /builds/download-speedbag.sh
fi

cd /work/speedbag || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
