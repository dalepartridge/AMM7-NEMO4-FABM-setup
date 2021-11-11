#!/bin/bash

# Build FABM with cray compiler

module -s restore /work/n01/shared/acc/n01_modules/ucx_env
module load cmake

ERSEM_DIR=$CODE_DIR/ersem
FABM_DIR=$CODE_DIR/fabm
FABM_INSTALL=$CODE_DIR/fabm-cray

mkdir $FABM_INSTALL
cd $FABM_INSTALL
cmake $FABM_DIR/src -DFABM_HOST=nemo -DFABM_ERSEM_BASE=$ERSEM_DIR -DFABM_EMBED_VERSION=ON -DCMAKE_INSTALL_PREFIX=$FABM_INSTALL -DCMAKE_Fortran_COMPILER=ftn #-DCMAKE_BUILD_TYPE=debug
make
make install -j4




