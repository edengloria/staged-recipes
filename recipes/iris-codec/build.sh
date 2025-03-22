#!/bin/bash

mkdir build && cd  build

CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

cmake ${CMAKE_ARGS} -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -D IRIS_BUILD_SHARED=OFF \
      -D IRIS_BUILD_STATIC=OFF \
      -D IRIS_BUILD_ENCODER=ON \
      -D IRIS_BUILD_DEPENDENCIES=OFF \
      -D IRIS_BUILD_PYTHON=ON \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_ASM_NASM_COMPILER=yasm \
      $SRC_DIR

cmake --build . --config Release -j$CPU_COUNT

cmake --install .
