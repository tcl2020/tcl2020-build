#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d  /workspaces/libspatialite ]; then
	cd /workspaces && sh /builds/download-libspatialite.sh
fi

cd /workspaces/libspatialite || exit 1
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr --disable-freexl
make && make install

build_cleanup
