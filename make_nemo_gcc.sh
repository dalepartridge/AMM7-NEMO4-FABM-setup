#!/bin/bash

# Build NEMO with GCC compiler
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

export FABM_INSTALL=$CODE_DIR/fabm-gcc
export XIOS_INSTALL=
NEMO_DIR=$CODE_DIR/nemo
cd $NEMO_DIR

# AMM7 FABM
CFG=AMM7_FABM_GCC
ARCH=GCC_ARCHER2
REF=AMM7_NOSRC
printf 'y\nn\nn\ny\nn\nn\nn\nn\n' |./makenemo -n $CFG -r $REF -m $ARCH -j 0
./makenemo -n $CFG -r $REF -m $ARCH -j 4 clean
./makenemo -n $CFG -r $REF -m $ARCH -j 4

CFG=AMM7_FABM_GCC_DEBUG
ARCH=GCC_ARCHER2_DEBUG
REF=AMM7_NOSRC
printf 'y\nn\nn\ny\nn\nn\nn\nn\n' |./makenemo -n $CFG -r $REF -m $ARCH -j 0
./makenemo -n $CFG -r $REF -m $ARCH -j 4 clean
./makenemo -n $CFG -r $REF -m $ARCH -j 4
