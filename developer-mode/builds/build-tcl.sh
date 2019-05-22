#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/tcl ]; then 
    cd /workspace && sh /builds/download-tcl.sh
fi

if [ ! -f /workspace/tcl/minizip ]; then
	# tcl8.7 assumes minizip in ../minizip, will cleanup when tcl8.7 releases
	cp /usr/bin/minizip /workspace/tcl
fi

mkdir -p /workspace/logs
echo "Running the autoconf configure in /workspace/tcl/unix"
cd /workspace/tcl/unix
./configure CPPFLAGS='-DHAVE_FAST_TSD=1' --prefix=/usr --exec-prefix=/usr 2>&1 | tee -a /workspace/logs/tcl.log

cd /workspace/tcl/unix
echo "Building TCL"
# cut down on the output to stdout to make Travis-CI consoles faster
make 2>&1 | tee -a /workspace/logs/tcl.log | cut -c1-64
make install

build_cleanup

