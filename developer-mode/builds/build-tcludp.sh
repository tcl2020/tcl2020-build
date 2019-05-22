#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcpudp ]; then
	cd /workspaces && sh /builds/download-tcludp.sh
fi

cd /workspaces/tcludp || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
