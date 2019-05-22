#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/zookeepertcl ]; then
	cd /workspace && sh /builds/download-zookeepertcl.sh
fi

cd /workspace/zookeepertcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
