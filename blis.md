# Configuration Options for Blis Configuration
* --prefix=${MY_LIBS}/optblas/blis
    * Tells the configuration tool where to install to
* --enable-argmax-hack
    * Fixes a bug during compilation
* --enable-static
    * Ensures that we build a static library
* --enable-dynamic
    * Ensures that we build a dynamic library
* --enable-blas
    * BLAS compatibility layer
* --enable-cblas
    * CBLAS compatibility layer
* --disable-aocl-dynamic
    * Disables dynamic selection of threads used if multithreading is enabled in a different build
* --disable-threading
    * Ensures that we are not multithreading for sequential experiments
# Environment Variables Used
* MY_LIBS
    * Root path to where I put all libraries I build
* CC
    * gnu C compiler
* FC
    * gnu Fortran compiler
* CFLAGS
    * -fno-tree-slp-vectorize
        * Bug fix for asm related build failure found here: https://github.com/flame/blis/issues/845
