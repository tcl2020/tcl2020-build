#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tcl.gd ]; then
	cd /workspace && sh /builds/download-tcl.gd.sh
fi

cd /workspace/tcl.gd || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
