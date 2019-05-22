#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/scotty ]; then
	cd /workspaces && sh /builds/download-scotty.sh
fi

cd /workspaces/scotty/tnm || exit 1
autoreconf --force --install --verbose && \
./configure && make && make install

build_cleanup

