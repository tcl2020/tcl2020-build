#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/cpptcl ]; then
    cd /work && sh /builds/download-cpptcl.sh
fi

export TCL_VERSION_MINOR=7
cd /work/cpptcl && make clean && make && make install

build_cleanup

