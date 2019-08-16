[![Build Status](https://travis-ci.org/tcl2020/tcl2020-build.svg?branch=master)](https://travis-ci.org/tcl2020/tcl2020-build)

Build and packaging system based on [Docker](http://docker.org)

The developer-mode Dockerfile is a monolithic source based build.
All of the packages are compiled from source on top of a minimal
OS image based on [Debian-slim](https://hub.docker.com/_/debian/).
You need to provide a Docker container on your platform.
The Docker image and container will manage all of the platform packages and build tools needed
for a source build.
By using Docker you can easily develop on Linux or OS X.

## Made for TravisCI.org
This build system is intended to be used with a CI system.
You can edit changes directly on github.com.
Then, [TravisCI.org](http://travisci.org) can build the system as part of the process of a pull request.
If for example you need to make a small version change to a package, the CI build system will automatically
check the build.

## The base OS platform for developer-mode

A Docker image named tcl-2020-dev is created for the system platform.
This image can be created with

```docker build -t tcl-2020-dev developer-mode```

This Docker image has all the required platform packages.
The platform packages are installed in the script [developer-mode/setup-docker-env.sh](developer-mode/setup-docker-env.sh).
This script loads all of the Linux configurations.

If you are creating your own container for tcl2020, then you can replace the tcl-2002-dev container 
with the Linux system you choose.  The build scripts for tcl2020 should be compatible with any container images which 
contain the C++ build tools supporting C++17 or better.

## Using tcl-2020-dev as a build server

The tcl-2020-dev container can be used as a build server.
You can Docker exec into the container to compile and test installs.

Run the build container in the background with Docker.
```
mkdir -p $PWD/workspaces
docker run -d -v $PWD/workspaces:/workspaces -v $PWD/developer-mode/builds:/builds --name dev tcl-2020-dev
```
Build everything in tcl2020 using a docker exec.
```
docker exec -it dev bash /builds/build-all.sh
```
Modify the source code of any package in the workspaces directory. Then you can use make, cmake, ... to rebuild the container with
the changes.  Use the build container with your favorite IDE.

## source packages for developer-mode

Source packages are added to the Docker image using
the [developer-mode/builds/build-all.sh](developer-mode/builds/build-all.sh) script.

To add packages or features create a two shell scripts in developer-mode/builds.
One shell script will download the source package: download-yourpackage.sh. The other script
will build the package: build-yourpackage.sh.
Add your new build script, build-yourpackage.sh, to developer-mode/builds/build-all.sh.

See the [.travis.yml](.travis.yml) file for the build actions.
