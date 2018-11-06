# Helper functions for build scripts

TCLSH="tclsh8.7"
export TCLLIBPATH=/usr/lib/tcl8.7/library
TCL_CONFIG="/work/tcl/unix/tclConfig.sh"

build_setup () {
	if [ ! -d /work ]; then
		echo "Missing /work directory."
		echo "Be sure to docker run -v $WORK_DIR_PATH:/work ..."
		exit 1
	fi
}

build_git_clone () {
	local name="$1"
	local repo="$2"
	local extra="$3"
	if [ ! -d "/work/$name" ]; then
		echo "No git clone of $name found".
        	cd /work
		echo git clone "$extra" "$repo"
		git clone $extra "$repo"
	fi
}


build_cleanup () {
	# fix any permissions messed up by the Docker user id
	# allow edits to the source outside of the container
	find /work/tcllib -type d -print0 | xargs -0 chmod go+rwx
	find /work/tcllib -type f -print0 | xargs -0 chmod go+rw
}
