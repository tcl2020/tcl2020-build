#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/memcached-for-Tcl -o ! -d /workspaces/libmemcached ]; then
    cd /workspaces && sh /builds/download-memcached-for-Tcl.sh
fi

cd /workspaces/libmemcached
mkdir build
cd build
cmake ..
make
make install

cd /workspaces/memcached-for-Tcl
autoreconf -vi
./configure ; make ; make install

build_cleanup

