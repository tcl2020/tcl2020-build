#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcl ]; then 
    cd /workspaces && sh /builds/download-tcl.sh
fi

if [ ! -f /workspaces/tcl/minizip ]; then
	# tcl8.7 assumes minizip in ../minizip, will cleanup when tcl8.7 releases
	cp /usr/bin/minizip /workspaces/tcl
fi

mkdir -p /workspaces/logs
echo "Running the autoconf configure in /workspaces/tcl/unix"
cd /workspaces/tcl/unix
./configure TCL_PACKAGE_PATH="/usr/local/lib" CPPFLAGS='-DHAVE_FAST_TSD=1' --prefix=/usr --exec-prefix=/usr 2>&1 | tee -a /workspaces/logs/tcl.log

cd /workspaces/tcl/unix
echo "Building TCL"
# cut down on the output to stdout to make Travis-CI consoles faster
make 2>&1 | tee -a /workspaces/logs/tcl.log | cut -c1-64
make install

build_cleanup

