# Configuration Options for Flame Configuration
* --prefix=${MY_LIBS}/optblas/flame
    * Root directory of where to install everything to
* --enable-static-build
    * Build the static library
* --enable-dynamic-build
    * Build the dynamic libary
* --enable-max-arg-list-hack
    * Fix a compilation issue related to the length of the compile command
* --enable-lapack2flame
    * Ensures all lapack functions are in this build even if not optimized
* --enable-multithreading=no
    * Ensures that we do not compile with multithreading capabilities
* --enable-vector-intrinsics=sse
    * Ensures we can take advantage of our hardware's vectorized inputs
* --enable-memory-alignment=8
    * Suggested value for 64-bit machines
* --enable-ldim-alignment
    * Allocates more memory than strictly necessary to ensure our memory is properly aligned
* --enable-optimizations="-march=znver4 -O3" 
    * Suggested value when compiling on zen4 machines
* --enable-amd-opt
    * Enables optimizations for AMD hardware

For more information on above, see the help text for configure

# Environment Variables Used
* MY_LIBS
    * Root path to where I put all libraries I build
