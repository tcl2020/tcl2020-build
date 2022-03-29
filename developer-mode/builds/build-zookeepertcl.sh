#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/zookeepertcl ]; then
	cd /workspaces && sh /builds/download-zookeepertcl.sh
fi

cd /workspaces/zookeepertcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make ; make install

build_cleanup
