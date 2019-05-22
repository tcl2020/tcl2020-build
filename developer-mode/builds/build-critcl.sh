#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/critcl ]; then
    cd /workspaces && sh /builds/download-critcl.sh
fi

cd /workspaces/critcl

$TCLSH build.tcl install $TCLLIBPATH

build_cleanup

