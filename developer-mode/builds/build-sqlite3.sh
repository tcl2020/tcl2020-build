#!/bin/sh

if [ ! -d  /work/sqlite ]; then
	mkdir /work/sqlite
	cd /work/sqlite
        curl -o t.tar.gz https://www.sqlite.org/2018/sqlite-autoconf-3250200.tar.gz
    tar -xf t.tar.gz
fi

echo Build sqlite3
cd /work/sqlite/sqlite-autoconf-3250200/
autoreconf -vi
env CFLAGS=-DSQLITE_ENABLE_COLUMN_METADATA=1 ./configure --prefix=/usr --exec-prefix=/usr
make
echo Installing sqlite3 over any package install
cp sqlite3.h sqlite3ext.h /usr/include
cp sqlite3 /usr/bin
/bin/bash ./libtool --mode=install /usr/bin/install -c libsqlite3.la '/usr/lib/x86_64-linux-gnu'
/bin/bash ./libtool --finish '/usr/lib/x86_64-linux-gnu'

echo Building sqlite3 TCL extension
cd /work/sqlite/sqlite-autoconf-3250200/tea
./configure
make
make install
