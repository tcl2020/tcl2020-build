#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/speedbag ]; then
	cd /workspaces && sh /builds/download-speedbag.sh
fi

cd /workspaces/speedbag || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make ; make install

build_cleanup
