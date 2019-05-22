#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tcllib ]; then
	cd /workspace && sh /builds/download-tcllib.sh
fi

echo "Running the autoconf configure in /workspace/tcllib"
cd /workspace/tcllib
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /workspace/tcllib
echo "Building Tcllib"
make
make install

build_cleanup

