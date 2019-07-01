#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcltls ]; then
	cd /workspaces && sh /builds/download-tcltls.sh
fi

cd /workspaces/tcltls || exit 1
cd tcltls-1.7.18 && ./configure --with-openssl-dir=/usr/lib/ssl && make && make install

build_cleanup

