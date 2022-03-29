#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcltls ]; then
	cd /workspaces && sh /builds/download-tcltls.sh
fi

echo Build tcltls
BUILD_VERSION=$(cd /workspaces/tcltls; ls -v | tail -1)
if [ ! -d "/workspaces/tcltls/$BUILD_VERSION" ]; then
	echo "Cannot determine tcltls build version"
	exit 1
else
	echo "Building /workspaces/tcltls/$BUILD_VERSION"
fi
cd "/workspaces/tcltls/$BUILD_VERSION/" || exit 1
./configure --with-openssl-dir=/usr/lib/ssl ; make ; make install

build_cleanup

