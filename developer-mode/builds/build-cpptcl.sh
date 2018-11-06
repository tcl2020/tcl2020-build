#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone cpptcl https://github.com/flightaware/cpptcl.git

cd /work/cpptcl && make && make install

build_cleanup
