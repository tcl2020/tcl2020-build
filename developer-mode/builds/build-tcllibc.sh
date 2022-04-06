#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcllib ]; then
	cd /workspaces && sh /builds/download-tcllib.sh
fi

cd /workspaces/tcllib
# Build the critcl components of tcllib
/usr/bin/tclsh8.6 sak.tcl critcl
cp -r modules/tcllibc /usr/lib/tcllibc

build_cleanup

