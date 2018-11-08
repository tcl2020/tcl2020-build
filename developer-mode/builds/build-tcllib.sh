#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tcllib ]; then
	cd /work && sh /builds/download-tcllib.sh
fi

echo "Running the autoconf configure in /work/tcllib"
cd /work/tcllib
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /work/tcllib
echo "Building Tcllib"
make
make install

build_cleanup

