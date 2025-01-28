#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d  /workspaces/sqlite ]; then
	cd /workspaces && sh /builds/download-sqlite3.sh
fi

echo Build sqlite3
BUILD_VERSION=$(cd /workspaces/sqlite; ls -v | tail -1)
if [ ! -d "/workspaces/sqlite/$BUILD_VERSION" ]; then
    echo "Cannot determine sqlite build version"
    exit 1
else
    echo "Building /workspaces/sqlite/$BUILD_VERSION"
fi
cd "/workspaces/sqlite/$BUILD_VERSION/" || exit 1
autoreconf -vi
env CFLAGS="-DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_MAX_ATTACHED=125" ./configure --prefix=/usr --exec-prefix=/usr
make
echo Installing sqlite3 over any package install
cp sqlite3.h sqlite3ext.h /usr/include
cp sqlite3 /usr/bin
/bin/bash ./libtool --mode=install /usr/bin/install -c libsqlite3.la '/usr/lib/x86_64-linux-gnu'
/bin/bash ./libtool --finish '/usr/lib/x86_64-linux-gnu'

echo Building sqlite3 TCL extension
cd "/workspaces/sqlite/$BUILD_VERSION/tea"
./configure
make
make install

build_cleanup

