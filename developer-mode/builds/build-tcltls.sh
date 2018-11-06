#!/bin/sh
. /builds/common.sh

build_setup

mkdir /work/tcltls
cd /work/tcltls
curl 'https://core.tcl.tk/tcltls/uv/tcltls-1.7.16.tar.gz' | tar -xvzf -
cd tcltls-1.7.16 && ./configure && make && make install

build_cleanup

