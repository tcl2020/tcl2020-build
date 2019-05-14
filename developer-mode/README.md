# Docker container and build scripts

This directory contains all the development Docker container, build and download scripts.

The Dockerfile defines a Linux container image suitable for building the tcl2020 packages.

# Dockerfile is intentionally minimal

The Dockerfile is intentionally minimal.
Adjust the Linux configuration to meet your needs.

# Download scripts

Download scripts take care of the small differences in getting source packages.  Most are simply git clones.
If you want to clone a specific release.  Then change the download script for the package.

# Build scripts

The build scripts should call the download script if needed.
