#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d  /work/sqlite ]; then
	cd /work && sh /builds/download-sqlite3.sh
fi

echo Build sqlite3
cd /work/sqlite/sqlite-autoconf-3250300/ || exit 1
autoreconf -vi
env CFLAGS=-DSQLITE_ENABLE_COLUMN_METADATA=1 ./configure --prefix=/usr --exec-prefix=/usr
make
echo Installing sqlite3 over any package install
cp sqlite3.h sqlite3ext.h /usr/include
cp sqlite3 /usr/bin
/bin/bash ./libtool --mode=install /usr/bin/install -c libsqlite3.la '/usr/lib/x86_64-linux-gnu'
/bin/bash ./libtool --finish '/usr/lib/x86_64-linux-gnu'

echo Building sqlite3 TCL extension
cd /work/sqlite/sqlite-autoconf-3250300/tea
./configure
make
make install

build_cleanup

