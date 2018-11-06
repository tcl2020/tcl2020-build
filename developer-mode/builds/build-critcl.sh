#!/bin/sh
if [ ! -d /work ]; then
	echo "Missing /work directory."
	echo "Be sure to docker run -v $WORK_DIR_PATH:/work ..."
	exit 1
fi

if [ ! -d /work/critcl ]; then
	echo "No git clone of critcl found".
  cd /work
	git clone https://github.com/andreas-kupries/critcl.git
fi

cd /work/critcl
echo "Building critcl"
tclsh8.7 build.tcl install

# fix any permissions messed up by the Docker user id
# allow edits to the source outside of the container
find /work/critcl -type d -print0 | xargs -0 chmod go+rwx
find /work/critcl -type f -print0 | xargs -0 chmod go+rw
