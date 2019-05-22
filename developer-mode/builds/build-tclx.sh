#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclx ]; then 
	cd /workspaces && sh /builds/download-tclx.sh
fi

echo "Running the autoconf configure in /workspaces/tclx"
cd /workspaces/tclx || exit 1
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /workspaces/tclx || exit 1
echo "Building Tclx"
make
make install

build_cleanup

