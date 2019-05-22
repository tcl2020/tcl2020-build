#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tclx ]; then 
	cd /workspace && sh /builds/download-tclx.sh
fi

echo "Running the autoconf configure in /workspace/tclx"
cd /workspace/tclx || exit 1
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /workspace/tclx || exit 1
echo "Building Tclx"
make
make install

build_cleanup

