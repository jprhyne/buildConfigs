#!/bin/env bash

# This file holds the configuration options for configuring and compiling blis.
if [[ -v GIT_REPO_LOC ]]; then
  cd ${GIT_REPO_LOC}
fi
# Check if the blis folder exists here. Otherwise, we try to clone the repository

if [ ! -d aocl-utils ]; then
  read -p "\"aocl-utils\" directory does not exist in the current working directory. Want to clone it? [Y/n] " -e download
  if [ "$download" == "n" ] || [ "$download" == "N" ]; then
    echo "Either set GIT_REPO_LOC to the parent directory of aocl-utils or clone the repository in this directory"
  fi
  git clone git@github.com:amd/aocl-utils.git
fi

cd aocl-utils

# Now, we run our configuration command. For an explanation of environment variables or configuration options used, see utils.md
cmake -B default -DCMAKE_INSTALL_PREFIX=${MY_LIBS}/optblas/aocl-utils

# Build
cmake --build default --config release -j8

# Install
cmake --install default --config release

# vim: ft=bash
