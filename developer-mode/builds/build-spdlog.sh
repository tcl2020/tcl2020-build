#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/spdlog ]; then
	cd /workspaces && sh /builds/download-spdlog.sh
fi

cd /workspaces/spdlog || exit 1
mkdir build
cd build
cmake .. || exit 1
make
make install

build_cleanup
