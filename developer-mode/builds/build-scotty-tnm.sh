#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/scotty ]; then
	cd /work && sh /builds/download-scotty.sh
fi

cd /work/scotty/tnm || exit 1
autoreconf --force --install --verbose && \
./configure && make && make install

build_cleanup

