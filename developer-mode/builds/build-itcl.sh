#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone itcl https://github.com/tcltk/itcl.git

cd /work/itcl
# TODO
# iTcl does not have the TEA files
# copy them from another project for now
# we should checkout TEA and use that
mkdir tclconfig && cp ../tcllauncher/tclconfig/* tclconfig
./configure && make all && make install

build_cleanup
