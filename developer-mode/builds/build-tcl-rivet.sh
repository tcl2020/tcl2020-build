#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspaces/tcl-rivet ]; then
	cd /workspaces && sh /builds/download-tcl-rivet.sh
fi

cd /workspaces/tcl-rivet || exit 1
autoreconf -vi && ./configure && make && make install

# Change Apache server from MPM event to MPM prefork
if [ -d /etc/apache2/mods-enabled ]; then
    rm -rf /etc/apache2/mods-enabled/mpm_event.*
    ln -s /etc/apache2/mods-available/mpm_prefork.conf /etc/apache2/mods-enabled/mpm_prefork.conf
    ln -s /etc/apache2/mods-available/mpm_prefork.load /etc/apache2/mods-enabled/mpm_prefork.load
fi

build_cleanup
