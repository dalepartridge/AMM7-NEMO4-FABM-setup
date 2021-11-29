#!/bin/bash

# Link files for run

#compiler=cray
compiler=gcc

cp $CODE_DIR/nemo/cfgs/AMM7_FABM_${compiler^^}/EXP00/nemo nemo.exe
cp $CODE_DIR/xios-${compiler}/bin/xios_server.exe .


ln -s ../../INPUTS/DOM/coordinates.bdy.nc .
ln -s ../../INPUTS/DOM/coordinates.skagbdy.nc .
ln -s ../../INPUTS/DOM/domain_cfg.nc .

ln -s ../../INPUTS/DOM/restart.nc .
ln -s ../../INPUTS/DOM/restart_trc.nc .

ln -s ../../INPUTS/RIV/LOCATE_rivers.2005.alk.nc river.nc

mkdir RESTART
