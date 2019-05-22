#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/scotty ]; then
	cd /workspace && sh /builds/download-scotty.sh
fi

cd /workspace/scotty/tnm || exit 1
autoreconf --force --install --verbose && \
./configure && make && make install

build_cleanup

