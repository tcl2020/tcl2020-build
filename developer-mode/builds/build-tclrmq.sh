#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclrmq ]; then 
	cd /workspaces && sh /builds/download-tclrmq.sh
fi

cd /workspaces/tclrmq || exit 1
mkdir -p /usr/lib/rmq
cp package/* /usr/lib/rmq

build_cleanup

