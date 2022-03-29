#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/casstcl ]; then
	cd /workspaces && sh /builds/download-casstcl.sh
fi

cd /workspaces/cpp-driver || exit 1
mkdir build
cd build
cmake .. || exit 1
make
make install

cd /workspaces/casstcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
