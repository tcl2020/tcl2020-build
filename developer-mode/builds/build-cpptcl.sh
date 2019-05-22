#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/cpptcl ]; then
    cd /workspace && sh /builds/download-cpptcl.sh
fi

export TCL_VERSION_MINOR=7
cd /workspace/cpptcl && make clean && make && make install

build_cleanup

