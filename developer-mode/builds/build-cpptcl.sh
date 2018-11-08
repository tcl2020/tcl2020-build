#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/cpptcl ]; then
    cd /work && sh /builds/download-cpptcl.sh
fi

cd /work/cpptcl && make && make install

build_cleanup

