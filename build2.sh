#!/bin/sh
#
# Use the dev docker image to run a complete build. Loosen security for easier debugging.

# Check to see if the container is already there
if docker inspect dev > /dev/null 2>&1
then echo "dev container already exists, please be sure you're finished up before blowing things away underneath it"; exit 1
fi

# Clean up from previous builds
if [ -d workspaces ]
then
  if rm -rf $PWD/workspaces
  then echo "Clean"
  else echo "You've probably got some root-owned trash in workspaces" ; exit 1
  fi
fi
mkdir -p $PWD/workspaces

# Run with debugging.
docker run -d \
	-v $HOME:$HOME \
	-v $PWD/workspaces:/workspaces -v $PWD/developer-mode/builds:/builds \
	--cap-add=SYS_PTRACE --security-opt=apparmor:unconfined --security-opt=seccomp:unconfined \
	--name dev tcl-2020-dev

# Kick off build
docker exec -it dev bash /builds/build-all.sh
