#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tcpudp ]; then
	cd /workspace && sh /builds/download-tcludp.sh
fi

cd /workspace/tcludp || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
