#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/zookeepertcl ]; then
	cd /work && sh /builds/download-zookeepertcl.sh
fi

cd /work/zookeepertcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
