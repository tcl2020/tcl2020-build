#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcl.gd ]; then
	cd /workspaces && sh /builds/download-tcl.gd.sh
fi

cd /workspaces/tcl.gd || exit 1
autoreconf --force --install --verbose
CFLAGS="-DGD_JPEG -DGD_PNG" ./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include || exit 1
make ; make install

build_cleanup
