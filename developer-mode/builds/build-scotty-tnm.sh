#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone scotty https://github.com/flightaware/scotty.git

cd /work/scotty/tnm
autoreconf --force --install --verbose && \
./configure && make && make install

build_cleanup
