#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tclcurl-fa ]; then
    cd /workspaces && sh /builds/download-tclcurl-fa.sh
fi

cd /workspaces/tclcurl-fa ; ./configure --enable-threads ; make ; make install

build_cleanup

