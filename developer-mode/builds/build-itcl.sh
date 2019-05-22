#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/itcl ]; then
	cd /workspaces && sh /builds/download-itcl.sh
fi

cd /workspaces/itcl || exit 1
# TODO
# iTcl does not have the TEA files
# copy them from another project for now
# we should checkout TEA and use that
mkdir tclconfig && cp ../tcllauncher/tclconfig/* tclconfig
./configure && make all && make install

build_cleanup

