#!/bin/sh
. /builds/common.sh

build_setup

mkdir /work/tdom
cd /work/tdom
curl 'http://tdom.org/downloads/tdom-0.9.0-src.tgz' | tar -xvzf -
cd tdom-0.9.0 && ./configure && make && make install

build_cleanup
