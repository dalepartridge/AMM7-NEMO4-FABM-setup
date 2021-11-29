#!/bin/bash

# Build FABM with GCC compiler

module -s restore PrgEnv-gnu
module -s load cray-hdf5-parallel
module -s load cray-netcdf-hdf5parallel
module -s unload cray-mpich
module -s unload craype-network-ofi
module -s load craype-network-ucx
module -s load cray-mpich-ucx
module -s load libfabric
module -s load gcc
module -s swap gcc/10.1.0 gcc/9.3.0
module -s load cmake

ERSEM_DIR=$CODE_DIR/ersem
FABM_DIR=$CODE_DIR/fabm
FABM_INSTALL=$CODE_DIR/fabm-gcc

mkdir $FABM_INSTALL
cd $FABM_INSTALL
cmake $FABM_DIR/src -DFABM_HOST=nemo -DFABM_ERSEM_BASE=$ERSEM_DIR -DFABM_EMBED_VERSION=ON -DCMAKE_INSTALL_PREFIX=$FABM_INSTALL -DCMAKE_Fortran_FLAGS:STRING="-fdefault-real-8 -O3 -funroll-all-loops -fcray-pointer -cpp -ffree-line-length-none" #-DCMAKE_BUILD_TYPE=debug
make
make install -j4

cd $WORK
