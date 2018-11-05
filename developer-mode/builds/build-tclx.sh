#!/bin/sh
if [ ! -d /work ]; then
	echo "Missing /work directory."
	echo "Be sure to docker run -v $WORK_DIR_PATH:/work ..."
	exit 1
fi

if [ ! -d /work/tclx ]; then 
	echo "No git clone of tclx found".
	echo "git clone https://github.com/flightaware/tclx.git"
        cd /work
	git clone https://github.com/flightaware/tclx.git
fi

if [ ! -f /work/.tclx_configured ]; then
	echo "Running the autoconf configure in /work/tclx"
	cd /work/tclx
	autoreconf -vi
	./configure --prefix=/usr --exec-prefix=/usr
	touch /work/.tclx_configured
fi

cd /work/tclx
echo "Building Tclx"
make
make install

# fix any permissions messed up by the Docker user id
# allow edits to the source outside of the container
find /work/tclx -type d -print0 | xargs -0 chmod go+rwx
find /work/tclx -type f -print0 | xargs -0 chmod go+rw
