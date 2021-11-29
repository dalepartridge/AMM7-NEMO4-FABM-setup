#!/bin/bash

# Build XIOS with GCC compiler

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

XIOS_DIR=$CODE_DIR/xios
XIOS_INSTALL=$CODE_DIR/xios-gcc
cd $XIOS_DIR

# Copy arch files
cp $CODE_DIR/extra-files/xios/arch-GCC_ARCHER2* $XIOS_DIR/arch/
cp $CODE_DIR/extra-files/xios/Config_gcc.pm $XIOS_DIR/tools/FCM/lib/Fcm/Config.pm

cd $XIOS_DIR && ./make_xios --prod --arch GCC_ARCHER2 --netcdf_lib netcdf4_par --job 16 --full
rsync -a $XIOS_DIR/bin $XIOS_DIR/inc $XIOS_DIR/lib $XIOS_INSTALL

cd $WORK
