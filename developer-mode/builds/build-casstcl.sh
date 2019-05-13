#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/casstcl ]; then
	cd /work && sh /builds/download-casstcl.sh
fi

cd /work/cpp-driver || exit 1
mkdir build
cmake ..
make
make install

cd /work/casstcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include 
make && make install

build_cleanup
