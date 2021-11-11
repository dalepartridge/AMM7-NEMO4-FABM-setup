#################################################
# Script to checkout and compile XIOS2.5
# Tested on revision 2022, following instructions provided https://docs.archer2.ac.uk/research-software/nemo/nemo/#compiling-xios-and-nemo
#
# Note that a precompiled version of XIOS2.5 is available for use here:
# /work/n01/shared/acc/xios-2.5
#################################################

#
module unload cray-mpich
module load craype-network-ucx
module load cray-mpich-ucx
module load libfabric
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel
module load gcc

XIOS_DIR=/home/n01/n01/dapa/code/xios2.5
svn checkout http://forge.ipsl.jussieu.fr/ioserver/svn/XIOS/branchs/xios-2.5 $XIOS_DIR
cd $XIOS_DIR

# Copy arch files
cp /work/n01/shared/acc/xios-2.5/arch/arch-X86_ARCHER2-Cray* $XIOS_DIR/arch/



# Compile
./make_xios --prod --arch X86_ARCHER2-Cray --netcdf_lib netcdf4_par --job 16 --full


