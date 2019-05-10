#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/Pgtcl ]; then
	cd /work && sh /builds/download-tclzlib.sh
fi

cd /work/tclzlib || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
