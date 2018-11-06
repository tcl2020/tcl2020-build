#!/bin/sh
if [ ! -d /work ]; then
	echo "Missing /work directory."
	echo "Be sure to docker run -v $WORK_DIR_PATH:/work ..."
	exit 1
fi

if [ ! -d /work/tcllib ]; then
	echo "No git clone of tcllib found".
        cd /work
	git clone https://github.com/tcltk/tcllib.git
fi

if [ ! -f /work/.tcllib_configured ]; then
	echo "Running the autoconf configure in /work/tcllib"
	cd /work/tcllib
	autoreconf -vi
	./configure --prefix=/usr --exec-prefix=/usr
	touch /work/.tcllib_configured
fi

cd /work/tcllib
echo "Building Tcllib"
make
make install

# fix any permissions messed up by the Docker user id
# allow edits to the source outside of the container
find /work/tcllib -type d -print0 | xargs -0 chmod go+rwx
find /work/tcllib -type f -print0 | xargs -0 chmod go+rw
