#!/bin/sh
if [ ! -d /work ]; then
	echo "Missing /work directory."
	echo "Be sure to docker run -v $WORK_DIR_PATH:/work ..."
	exit 1
fi

if [ ! -d /work/tcl ]; then 
	echo "No git clone of tcl found".
	echo "git clone https://github.com/TCL-2020/tcl.git"
	cd /work
	git clone https://github.com/TCL-2020/tcl.git
fi

if [ ! -f /work/tcl/minizip ]; then
	# tcl8.7 assumes minizip in ../minizip, will cleanup when tcl8.7 releases
	cp /usr/bin/minizip /work/tcl
fi

if [ ! -f /work/.tcl_configured ]; then
	echo "Running the autoconf configure in /work/tcl/unix"
	cd /work/tcl/unix
	./configure --prefix=/usr --exec-prefix=/usr >/work/.tcl.log 2>&1
	touch /work/.tcl_configured
fi

cd /work/tcl/unix
echo "Building TCL"
make 2>&1 | tee -a /work/.tcl.log | cut -c1-64
make install

# fix any permissions messed up by the Docker user id
# allow edits to the source outside of the container
find /work -type d -print0 | xargs -0 chmod go+rwx
find /work -type f -print0 | xargs -0 chmod go+rw
