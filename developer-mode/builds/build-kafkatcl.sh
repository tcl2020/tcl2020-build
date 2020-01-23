#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/kafkatcl ]; then
	cd /workspaces && sh /builds/download-kafkatcl.sh
fi

cd /workspaces/librdkafka || exit 1
./configure --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install && ldconfig

cd /workspaces/kafkatcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
