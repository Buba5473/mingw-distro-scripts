#!/bin/sh

export X_DISTRO_ROOT=/c/mingw

export X_DISTRO_BIN=$X_DISTRO_ROOT/bin
export X_DISTRO_INC=$X_DISTRO_ROOT/include
export X_DISTRO_LIB=$X_DISTRO_ROOT/lib

export PATH=$PATH:$X_DISTRO_BIN

export C_INCLUDE_PATH=$X_DISTRO_INC
export CPLUS_INCLUDE_PATH=$X_DISTRO_INC

function fail_with {
    echo $*
    if [ "$PS1" == "" ]; then exit 1; fi
}

function untar_file {
    tar --extract --directory=/c/temp/gcc --file=$* || fail_with $1 - EPIC FAIL
}

export X_MAKE_JOBS="-j$NUMBER_OF_PROCESSORS -O"
export X_B2_JOBS="-j$NUMBER_OF_PROCESSORS"
