# Helper functions for build scripts

TCLSH="tclsh8.6"
export TCLLIBPATH=/usr/lib/tcl8.6/library
TCL_CONFIG="/workspace/tcl/unix/tclConfig.sh"

build_setup () {
	if [ ! -d /workspace ]; then
		echo "Missing /workspace directory."
		echo "Be sure to docker run -v $WORK_DIR_PATH:/workspace ..."
		exit 1
	fi
}

build_git_clone () {
	local name="$1"
	local repo="$2"
	local extra="$3"
	if [ ! -d "/workspace/$name" ]; then
		echo "No git clone of $name found".
        	cd /workspace
		echo git clone "$extra" "$repo"
		git clone $extra "$repo"
	fi
}


build_cleanup () {
	# fix any permissions messed up by the Docker user id
	# allow edits to the source outside of the container
	find /workspace -type d -print0 | xargs -0 chmod go+rwx
	find /workspace -type f -print0 | xargs -0 chmod go+rw
}
