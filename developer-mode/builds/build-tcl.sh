#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/tcl ]; then 
    cd /work && sh /builds/download-tcl.sh
fi

if [ ! -f /work/tcl/minizip ]; then
	# tcl8.7 assumes minizip in ../minizip, will cleanup when tcl8.7 releases
	cp /usr/bin/minizip /work/tcl
fi

mkdir -p /work/logs
echo "Running the autoconf configure in /work/tcl/unix"
cd /work/tcl/unix
./configure CPPFLAGS='-DHAVE_FAST_TSD=1' --prefix=/usr --exec-prefix=/usr 2>&1 | tee -a /work/logs/tcl.log

cd /work/tcl/unix
echo "Building TCL"
# cut down on the output to stdout to make Travis-CI consoles faster
make 2>&1 | tee -a /work/logs/tcl.log | cut -c1-64
make install

build_cleanup

