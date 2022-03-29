#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclreadline ]; then
	cd /workspaces && sh /builds/download-tclreadline.sh
fi

. $TCL_CONFIG
export LIBS="$TCL_LIBS"

cd /workspaces/tclreadline ; autoreconf -vi ; ./configure --with-tk=no ; make ; make install

build_cleanup

