# AMM7-NEMO4-FABM-setup

This repository contains the setup needed to run the AMM7 domain for NEMO-FABM-ERSEM on ARCHER2. 

set_paths.sh
------------
Set the environment and working directory, always run before running any scripts

clone_repositories.sh
---------------------
Clone XIOS, ERSEM, FABM and NEMO

make_{xios,fabm,nemo}_cray.sh
----------------------------
Compile and build software using the CRAY compiler. XIOS and FABM must be run before NEMO

gcc_scripts/make_{xios,fabm,nemo}_gcc.sh
----------------------------
Alternative scripts to compile and build software using the GCC compiler. XIOS and FABM must be run before NEMO

RUN/EXP00
---------
Configuration files needed to execute a run. Includes a script 'setup_run.sh' which will set symbolic links to the core input files, and copy across the executables (compiler dependent). 

setup_run.sh, fabm_input.nml, namelist_cfg and namelist_top_cfg all contain relative paths to various input files. 

INPUTS/{DOM,LBC,RIV,SBC}
------------------------
Contains larger netcdf files not included with the repository. Available from /work/n01/n01/dapa/AMM7-NEMO4/. Please put in the working directory at the same level as the RUN folder so as to maintain the relative links in the run configuration files. 
