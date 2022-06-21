#!/bin/sh
#
# Use the dev docker image to run a complete build. Loosen security for easier debugging.

mkdir -p $PWD/workspaces
docker run -d \
	-v $PWD/workspaces:/workspaces -v $PWD/developer-mode/builds:/builds \
	-cap-add=SYS_PTRACE --security-opt=apparmor:unconfined --security-opt=seccomp:unconfined \
	--name dev tcl-2020-dev

docker exec -it dev bash /builds/build-all.sh
