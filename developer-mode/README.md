# Dockerfile to work with full source code builds.

## Fork the tcl repository in TCL-2020
On github.com make a fork of https://github.com/TCL-2020/tcl

After the fork is ready, git clone your fork in a working area.

You are editing code in your fork.  This will get you ready to make a github.com pull request.
[See the documentation on pull requests](https://help.github.com/articles/about-pull-requests/)

```
$ mkdir $HOME/work
$ cd $HOME/work
$ git clone <your fork's url here>
```
## Build the Docker image
```
$ docker build -t tcl-2020-dev .
```
## Run the Docker image
We run the Docker image in the background.  Then we can submit commands with docker exec.

## Start the background container
```
$ docker run -d -v $HOME/work:/work --name dev tcl-2020-dev
```
We named the container dev so that the docker exec commands are short.

## Build the TCL executable
We build the TCL code in the Docker container instance.
You can run this docker command from any directory outside the container.
The script runs make and the script fixes the file permissions in case
they get changed.
```
$ docker exec -it dev sh /builds/build-tcl.sh
```
## Run the TCL interpreter
Now that we have created /bin/tclsh8.7 we can run it in the container.
```
$ docker exec -it dev tclsh8.7
% info patchlevel
8.7a2
% exit
```

## Edit the code and then re-build the executable
We can edit the source code outside of Docker.
Then build and run the new /bin/tclsh8.7 in the container.
```
$ vi $HOME/work/tcl/generic/tclCmdIL.c
# in vi try to change the output of patchlevel
#   hint change
#      Tcl_SetObjResult(interp, Tcl_NewStringObj(patchlevel, -1))
#   to
#     Tcl_SetObjResult(interp, Tcl_NewStringObj("Hi!", -1))
# then
#   rebuild your edits
$ docker exec -it dev sh /builds/build-tcl.sh
$ docker exec -it dev tclsh8.7
% info patchlevel
Hi!
% exit
```
You can now improve the TCL code.
When your changes are ready commit them to your local git.
Then git push them to your github.com fork and then make a pull request.
