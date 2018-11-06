[![Build Status](https://travis-ci.org/TCL-2020/dockerfiles.svg?branch=master)](https://travis-ci.org/TCL-2020/dockerfiles)

Build and packaging system based on [Docker](http://docker.org)

The developer-mode Dockerfile is a monolithic source based build.
All of the packages are compiled from source on top of a minimal
OS image based on [Debian-slim](https://hub.docker.com/_/debian/).
You need to provide a working Docker container on your platform.
The Docker image and container will manage all of the platform packages and build tools needed
for a source build.
By using Docker you can easily develop on Linux or OS X.

## Made for TravisCI.org
This build system is intended to be used with a CI system.
You can edit changes directly on github.com.
Then, [TravisCI.org](http://travisci.org) can build the system as part of the process of a pull request.
If for example you need to make a small version change to a package, the CI build system will automatically
check the build.

## base platform for developer-mode

A Docker image named tcl-2020-dev is created for the system platform is created.
This image can be created with

```cd developer-mode && docker build -t tcl-2020-dev .```

This Docker image has all the required platform packages.
The platform packages are installed in the script [developer-mode/setup-docker-env.sh](developer-mode/setup-docker-env.sh).

## source packages for developer-mode

Source packages are added to the Docker image using
the [developer-mode/builds/build-all.sh](developer-mode/builds/build-all.sh) script.

To add packages or features create a new shell script in developer-mode/builds.
Add your new build script to developer-mode/builds/build-all.sh

See the [.travis.yml](.travis.yml) file for the build actions.

The builds can be run using this one line Docker run command

```
mkdir work
docker run -it -v $PWD/work:/work --name dev tcl-2020-dev sh /builds/build-all.sh
```

## Tips for using the developer mode container

### Use the work directory for source code

In Docker we mount the directory /work for the source code.
You can ```git clone``` or copy source files there.
If the source directory is present, /work/tcl, then the /builds/build-tcl.sh will skip the ```git clone```
and use the provided source.

### Run your container in the background

The tcl-2020-dev container can be run in the background using.

```
docker run -d -v $PWD/work:/work --name dev tcl-2020-dev
```

Then you can enter the docker container instance with ```docker exec -it dev /bin/bash```.
