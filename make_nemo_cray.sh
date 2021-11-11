#!/bin/bash

# Build NEMO with Cray compiler
module -s restore /work/n01/shared/acc/n01_modules/ucx_env
module load cmake

export FABM_INSTALL=$CODE_DIR/fabm-cray
export XIOS_INSTALL=
NEMO_DIR=$CODE_DIR/nemo
cd $NEMO_DIR

# AMM7 FABM
CFG=AMM7_FABM_CRAY
ARCH=X86_ARCHER2-Cray_FABM
REF=AMM7_NOSRC
printf 'y\nn\nn\ny\nn\nn\nn\nn\n' |./makenemo -n $CFG -r $REF -m $ARCH -j 0
./makenemo -n $CFG -r $REF -m $ARCH -j 4 clean
./makenemo -n $CFG -r $REF -m $ARCH -j 4 

'''
# AMM7 FABM DEBUG
CFG=AMM7_FABM_DEBUG
ARCH=X86_ARCHER2-Cray_FABM_DEBUG
REF=AMM7_NOSRC
printf 'y\nn\nn\ny\nn\nn\nn\nn\n' |./makenemo -n $CFG -r $REF -m $ARCH -j 0
./makenemo -n $CFG -r $REF -m $ARCH -j 4 clean
./makenemo -n $CFG -r $REF -m $ARCH -j 4 
'''
