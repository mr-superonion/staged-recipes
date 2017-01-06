mkdir build
cd build

# FIXME: Not currently using vecmathlib due to clang++ returning an
# error on configure (not finding <iostream>)
# add something KERNEL_CLANGXX_FLAGS

cmake \
  -D CMAKE_INSTALL_PREFIX="${PREFIX}" \
  -D POCL_INSTALL_ICD_VENDORDIR="${PREFIX}/etc/OpenCL/vendors" \
  -D LLVM_CONFIG="${PREFIX}/bin/llvm-config" \
  -D HAVE_CLOCK_GETTIME=1 \
  -D KERNELLIB_HOST_CPU_VARIANTS=distro \
  -D OPENCL_LIBRARIES="-L${PREFIX}/lib;OpenCL" \
  ..

make -j 8
make install
