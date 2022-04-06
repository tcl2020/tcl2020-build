#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/memcached-for-Tcl ]; then
    cd /workspaces && sh /builds/download-memcached-for-Tcl.sh
fi

cd /workspaces/memcached-for-Tcl
autoreconf -vi
./configure ; make ; make install

build_cleanup

