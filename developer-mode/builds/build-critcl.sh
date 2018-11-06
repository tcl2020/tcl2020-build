#!/bin/sh
. /builds/common.sh

build_setup

build_git_clone critcl https://github.com/andreas-kupries/critcl.git

cd /work/critcl

$TCLSH build.tcl install $TCLLIBPATH

build_cleanup
