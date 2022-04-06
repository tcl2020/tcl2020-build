#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/thread ]; then
	cd /workspaces && sh /builds/download-tcltk-thread.sh
fi

cd /workspaces/thread
# TODO replace this copy of tclconfig
mkdir tclconfig && cp ../tcllauncher/tclconfig/* tclconfig
./configure ; make ; make install

build_cleanup

