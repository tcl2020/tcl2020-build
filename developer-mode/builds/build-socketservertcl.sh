#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/socketservertcl ]; then
	cd /workspaces && sh /builds/download-socketservertcl.sh
fi

cd /workspaces/socketservertcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make ; make install

build_cleanup
