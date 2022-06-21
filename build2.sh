#!/bin/sh
#
# Use the dev docker image to run a complete build. Loosen security for easier debugging.

# Clean up from previous builds
rm -rf $PWD/workspaces
mkdir -p $PWD/workspaces

# Run with debugging. Maybe add -v $HOME:$HOME for access to your own cloned repos.
docker run -d \
	-v $PWD/workspaces:/workspaces -v $PWD/developer-mode/builds:/builds \
	-cap-add=SYS_PTRACE --security-opt=apparmor:unconfined --security-opt=seccomp:unconfined \
	--name dev tcl-2020-dev

# Kick off build
docker exec -it dev bash /builds/build-all.sh
