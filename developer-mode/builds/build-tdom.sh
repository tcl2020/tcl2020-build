#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tdom ]; then
	cd /workspaces && sh /builds/download-tdom.sh
fi

cd /workspaces/tdom || exit 1
# TODO tdom will probably be patched at some time
# to remove CONST84
cd tdom-0.9.0 && ./configure CFLAGS='-DCONST84="const"' && make && make install

build_cleanup

