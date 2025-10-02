# Purpose

This file details the process for compiling cmake version 4.1.2 on the cluster. This is because 
when compiling aocl-utils, you need CMake version 3.26 or higher while only version 3.11.4 is 
installed

# Source

To download the source code, go to the [Download page](https://cmake.org/download/) and 
download the source tar ball for the correct version. 

## Other versions

While it is possible these steps will work
for future and previous versions, I have not tested it on any other versions, so proceed at
your own risk

# Steps (With running tests)

1. extract the gzipped tar ball and move into the directory
2. create a build directory and go into it
    * This looked like `mkdir -p build && cd build` for me
    * All future commands will assume we are in this folder
3. Determine what flags you want to set by running the bootstrap script and ask for the help text
`../bootstrap --help` for me. I will list the flags that I set, and unless you have good reason
to not do so, I'd recommend setting the flags the same. If you do not have write access to
/usr/local, then you need to set prefix to be somewhere you have write access to.
  * --parallel=4
    * You could do more, but I don't want to use too many resources for this compilation on the
      cluster
  * --prefix=${HOME}/my_cmake
    * Anywhere you have write access to will work, just remember this as installation will 
      drop everything in subdirectories of here.
4. run the bootstrap command with the flags determined in the previous step
  * For me, this was `../bootstrap --parallel=4 --prefix=${HOME}/my_cmake`
5. Finish compiling cmake with make
  * For me, this was `make -j4`
6. Run the test suite (not technically necessary, but good practice)
  * For me, this was `./bin/ctest`
  * The purpose of this test is, in my opinion, to know the limitations of using this version of 
      cmake, if you don't create CMAKE projects, then this will likely not be useful to you. So you
      can skip it.
7. If all tests pass or you are ready to install it and go, then you can install it to whatever
   directory you chose
  * For me, this was `make install`
8. To use this cmake version, you will need to call this new binary directly, so when compiling
   your programs, replace all instances of `cmake` with `$PREFIX/$BINDIR/cmake`
  * For me this would be: `${HOME}/my_cmake/bin/cmake`
  * You can test that you are calling the correct version by doing 
    `$PREFIX/$BINDIR/cmake --version` or if you used my values, do `${HOME}/my_cmake/bin/cmake --version`
