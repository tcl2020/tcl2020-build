#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/s6 ]; then
	mkdir -p /workspaces/s6
	cd /workspaces/s6 && sh /builds/download-s6.sh
fi

cd /workspaces/s6 || exit 1

cd skalibs ; ./configure ; make ; make install
cd ../execline ; ./configure ; make ; make install
cd ../s6 ; ./configure ; make ; make install

build_cleanup
