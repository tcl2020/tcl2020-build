#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcllib ]; then
	cd /workspaces && sh /builds/download-tcllib.sh
fi

echo "Running the autoconf configure in /workspaces/tcllib"
cd /workspaces/tcllib
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /workspaces/tcllib
echo "Building Tcllib"
make
make install

build_cleanup

