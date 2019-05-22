#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclzlib ]; then
	cd /workspaces && sh /builds/download-tclzlib.sh
fi

cd /workspaces/tclzlib || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
