#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tcpudp ]; then
	cd /work && sh /builds/download-tcludp.sh
fi

cd /work/tcludp || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
