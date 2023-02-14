
# configure
${BUILD_PREFIX}/bin/cmake ${CMAKE_ARGS} \
  -S${SRC_DIR} \
  -Bbuild \
  -GNinja \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=${CC} \
  -DCMAKE_CXX_COMPILER=${CXX} \
  -DCMAKE_C_FLAGS="${CFLAGS}" \
  -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DPYMOD_INSTALL_LIBDIR="/python${PY_VER}/site-packages" \
  -DPYTHON_EXECUTABLE=${PYTHON} \
  -DBUILD_SHARED_LIBS=ON \
  -DENABLE_OPENMP=OFF \
  -DCMAKE_INSIST_FIND_PACKAGE_pybind11=ON \
  -DCMAKE_INSIST_FIND_PACKAGE_qcelemental=ON \
  -DCMAKE_DISABLE_FIND_PACKAGE_libefp=ON \
  -DENABLE_XHOST=OFF \
  -DFRAGLIB_UNDERSCORE_L=OFF \
  -DFRAGLIB_DEEP=OFF \
  -DINSTALL_DEVEL_HEADERS=ON \
  -Dpybind11_DIR="${PREFIX}/share/cmake/pybind11" \
  -DLAPACK_LIBRARIES="${PREFIX}/lib/libmkl_rt${SHLIB_EXT}"


# build
cd build
make -j${CPU_COUNT}

# install
make install

# test
# pytest in conda testing stage
