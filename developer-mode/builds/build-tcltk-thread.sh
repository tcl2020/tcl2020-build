#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/thread ]; then
	cd /workspaces && sh /builds/download-tcltk-thread.sh
fi

cd /workspaces/thread
./configure && make && make install

build_cleanup

