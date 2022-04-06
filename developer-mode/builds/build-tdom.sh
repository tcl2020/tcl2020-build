#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tdom ]; then
	cd /workspaces && sh /builds/download-tdom.sh
fi

echo Build tdom
BUILD_VERSION=$(cd /workspaces/tdom; ls -v | tail -1)
if [ ! -d "/workspaces/tdom/$BUILD_VERSION" ]; then
	echo "Cannot determine tdom build version"
	exit 1
else
	echo "Building /workspaces/tdom/$BUILD_VERSION"
fi
cd "/workspaces/tdom/$BUILD_VERSION/" || exit 1
# TODO tdom will probably be patched at some time
# to remove CONST84
./configure CFLAGS='-DCONST84="const"' ; make ; make install

build_cleanup

