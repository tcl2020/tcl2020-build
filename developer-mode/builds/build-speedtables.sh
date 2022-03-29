#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/speedtables ]; then
	cd /workspaces && sh /builds/download-speedtables.sh
fi

cd /workspaces/speedtables || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make clean ; make ; make install

build_cleanup
