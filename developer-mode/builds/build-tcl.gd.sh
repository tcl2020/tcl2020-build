#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tcl.gd ]; then
	cd /work && sh /builds/download-pgtcl.sh
fi

cd /work/tcl.gd || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
