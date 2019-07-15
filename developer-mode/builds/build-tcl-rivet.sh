#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcl-rivet ]; then
	cd /workspaces && sh /builds/download-tcl-rivet.sh
fi

cd /workspaces/tcl-rivet || exit 1
autoreconf -vi
./configure --with-tcl=/usr/lib --with-apache=/usr --with-apxs=/usr/bin/apxs --with-tclsh=/bin/tclsh --with-rivet-target-dir=/usr/lib/tcltk/rivet3.1  --enable-version-display
make
make install

# configure rivet in Apache
echo "LoadModule rivet_module /usr/lib/apache2/modules/mod_rivet.so" >/etc/apache2/mods-available/rivet.load
cat <<EOF
<IfModule mod_rivet.c>
  AddType application/x-httpd-rivet .rvt
  AddType application/x-rivet-tcl .tcl
</IfModule>
EOF >/etc/apache2/mods-available/rivet.conf

# Enable rivet in Apache
ln -s /etc/apache2/mods-available/rivet.load /etc/apache2/mods-enabled/rivet.load
ln -s /etc/apache2/mods-available/rivet.conf /etc/apache2/mods-enabled/rivet.conf

# Change Apache server from MPM event to MPM prefork
rm -rf /etc/apache2/mods-enabled/mpm_event.*
ln -s /etc/apache2/mods-available/mpm_prefork.conf /etc/apache2/mods-enabled/mpm_prefork.conf
ln -s /etc/apache2/mods-available/mpm_prefork.load /etc/apache2/mods-enabled/mpm_prefork.load

build_cleanup
