#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/critcl ]; then
    cd /workspace && sh /builds/download-critcl.sh
fi

cd /workspace/critcl

$TCLSH build.tcl install $TCLLIBPATH

build_cleanup

