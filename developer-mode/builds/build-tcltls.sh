#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcltls ]; then
	cd /workspaces && sh /builds/download-tcltls.sh
fi

cd /workspaces/tcltls || exit 1
curl 'https://core.tcl.tk/tcltls/uv/tcltls-1.7.16.tar.gz' | tar -xvzf -
cd tcltls-1.7.16 && ./configure --with-openssl-dir=/usr/lib/ssl && make && make install

build_cleanup

