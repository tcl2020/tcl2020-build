#!/bin/sh

set -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/cpptcl ]; then
    cd /workspaces && sh /builds/download-cpptcl.sh
fi

cd /workspaces/cpptcl ; make clean ; make ; make install

build_cleanup

