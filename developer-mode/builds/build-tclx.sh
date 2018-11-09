#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tclx ]; then 
	cd /work && sh /builds/download-tclx.sh
fi

echo "Running the autoconf configure in /work/tclx"
cd /work/tclx || exit 1
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /work/tclx || exit 1
echo "Building Tclx"
make
make install

build_cleanup

