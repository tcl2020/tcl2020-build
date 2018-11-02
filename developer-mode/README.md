Dockerfile to work with full source code builds.
# Build the Docker image
```
$ docker build -t tcl-2020-dev .
```
# Fork the tcl repository in TCL-2020
On github.com make a fork of https://github.com/TCL-2020/tcl
Clone your fork in a working area.
```
$ mkdir $HOME/work
$ cd $HOME/work
$ git clone <your fork's url here>
```

# Run the Docker image
We run the Docker image in the background.  Then we can submit commands with docker exec.

## Start the background container
```
$ docker run -d -v $HOME/work:/work --name dev tcl-2020-dev
```
We named the container dev so that the docker exec commands are short.

## Build the TCL executable

```
$ docker exec -it dev sh /builds/build-tcl.sh
```
## Run the TCL interpreter
```
$ docker exec -it dev tclsh8.7
% info patchlevel
8.7a2
% exit
```

## Edit the code and then re-build the executable
```
$ vi $HOME/work/tcl/generic/tclCmdIL.c
# in vi try to change the output of patchlevel
# rebuild your edits
$ docker exec -it dev sh /builds/build-tcl.sh
$ docker exec -it dev tclsh8.7
% info patchlevel
Hi!
% exit
```
You can now improve the TCL code and then make a pull request.
