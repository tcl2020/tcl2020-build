#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/critcl ]; then
    cd /work && sh /builds/download-critcl.sh
fi

cd /work/critcl

$TCLSH build.tcl install $TCLLIBPATH

build_cleanup

