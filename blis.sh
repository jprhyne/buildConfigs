#!/bin/env bash

# This file holds the configuration options for configuring and compiling blis.
if [[ -v GIT_REPO_LOC ]]; then
  cd ${GIT_REPO_LOC}
fi
# Check if the blis folder exists here. Otherwise, we try to clone the repository

if [ ! -d blis ]; then
  read -p "\"blis\" directory does not exist in the current working directory. Want to clone it? [Y/n]" -e download
  if [ "$download" == "n" ] || [ "$download" == "N" ]; then
    echo "Either set GIT_REPO_LOC to the parent directory of blis or clone the repository in this directory"
  fi
  git clone git@github.com:amd/blis.git
fi

cd blis

# Now, we run our configuration command. For an explanation of environment variables or configuration options used, see blis.md
 ./configure \
   --prefix=${MY_LIBS}/optblas/blis \
   --enable-arg-max-hack \
   --enable-static \
   --enable-shared \
   --disable-threading \
   --enable-blas \
   --enable-cblas \
   --disable-aocl-dynamic \
   CC=gcc \
   FC=gfortran \
   CFLAGS=-fno-tree-slp-vectorize \
   zen4

 # Build
 make -j8

 # Install
 make install
# vim: ft=bash
