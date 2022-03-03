#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d  /workspaces/libspatialite ]; then
	cd /workspaces && sh /builds/download-libspatialite.sh
fi

echo Build libspatialite
BUILD_VERSION=$(cd /workspaces/libspatialite; ls -v | tail -1)
if [ ! -d "/workspaces/libspatialite/$BUILD_VERSION" ]; then
    echo "Cannot determine libspatialite build version"
    exit 1
else
    echo "Building /workspaces/libspatialite/$BUILD_VERSION"
fi
cd "/workspaces/libspatialite/$BUILD_VERSION/" || exit 1
autoreconf -vi
./configure --prefix=/usr/local --exec-prefix=/usr/local --disable-freexl
make && make install

build_cleanup
