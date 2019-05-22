#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/rl_json ]; then
	cd /workspaces && sh /builds/download-rl_json.sh
fi

cd /workspaces/rl_json || exit 1
#autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
