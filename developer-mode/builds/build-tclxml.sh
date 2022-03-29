#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/TclXML ]; then
	cd /workspaces && sh /builds/download-tclxml.sh
fi

cd /workspaces/TclXML || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make ; make install

build_cleanup
