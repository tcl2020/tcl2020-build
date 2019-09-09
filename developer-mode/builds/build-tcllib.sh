#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcllib ]; then
	cd /workspaces && sh /builds/download-tcllib.sh
fi

echo "Running the autoconf configure in /workspaces/tcllib"
cd /workspaces/tcllib
autoreconf -vi
./configure --prefix=/usr --exec-prefix=/usr

cd /workspaces/tcllib
echo "Building Tcllib"
# patch out -- in proc arguments for named parameters
cat modules/mime/mime.tcl | sed 's,what --,what ignore,' | sed 's,-- string,ignore string,' >mime.tcl
diff modules/mime/mime.tcl mime.tcl
mv mime.tcl modules/mime/mime.tcl
make
make install

/usr/bin/tclsh8.6 sak.tcl critcl
cp -r modules/tcllibc /usr/lib/tcllibc

build_cleanup

