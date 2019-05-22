#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/speedbag ]; then
	cd /workspace && sh /builds/download-speedbag.sh
fi

cd /workspace/speedbag || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
