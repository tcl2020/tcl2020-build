#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/socketservertcl ]; then
	cd /workspace && sh /builds/download-socketservertcl.sh
fi

cd /workspace/socketservertcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
