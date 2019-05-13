#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/kafkatcl ]; then
	cd /work && sh /builds/download-kafkatcl.sh
fi

cd /work/kafkatcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
