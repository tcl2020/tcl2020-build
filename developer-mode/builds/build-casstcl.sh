#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/casstcl ]; then
	cd /workspace && sh /builds/download-casstcl.sh
fi

cd /workspace/cpp-driver || exit 1
mkdir build
cd build
cmake .. || exit 1
make
make install

cd /workspace/casstcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include 
make && make install

build_cleanup
