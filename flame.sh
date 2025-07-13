#!/bin/env bash

# This file holds the configuration options for configuring and compiling blis.
if [[ -v GIT_REPO_LOC ]]; then
  cd ${GIT_REPO_LOC}
fi
# Check if the blis folder exists here. Otherwise, we try to clone the repository

if [ ! -d libflame ]; then
  read -p "\"libflame\" directory does not exist in the current working directory. Want to clone it? [Y/n]" -e download
  if [ "$download" == "n" ] || [ "$download" == "N" ]; then
    echo "Either set GIT_REPO_LOC to the parent directory of libflame or clone the repository in this directory"
  fi
  git clone git@github.com:amd/libflame.git
fi

cd libflame

# Now, we run our configuration command. For an explanation of environment variables or configuration options used, see flame.md
CFLAGS="-I${MY_LIBS}/optblas/blis/include -I${MY_LIBS}/optblas/aocl-utils/include" \
  ./configure \
  --prefix=${MY_LIBS}/optblas/flame \
  --enable-static-build \
  --enable-dynamic-build \
  --enable-max-arg-list-hack \
  --enable-lapack2flame \
  --enable-multithreading=no \
  --enable-vector-intrinsics=sse \
  --enable-memory-alignment=8 \
  --enable-ldim-alignment \
  --enable-optimizations="-march=znver4 -O3" \
  --enable-amd-opt

make -j8

make install
