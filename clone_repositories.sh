#!/bin/bash
  
# Clone code bases

ERSEM_DIR=$CODE_DIR/ersem
git clone https://gitlab.ecosystem-modelling.pml.ac.uk/stable/ersem.git $ERSEM_DIR

FABM_DIR=$CODE_DIR/fabm
git clone https://github.com/fabm-model/fabm.git $FABM_DIR

NEMO_DIR=$CODE_DIR/nemo
git clone https://gitlab.ecosystem-modelling.pml.ac.uk/gle/nemo404.git $NEMO_DIR
cp $CODE_DIR/nemo-files/Config.pm $NEMO_DIR/ext/FCM/lib/Fcm/Config.pm

