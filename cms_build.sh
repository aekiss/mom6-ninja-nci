#!/bin/bash

module swap PrgEnv-cray PrgEnv-intel
module load cray-netcdf

ninja=/group/pawsey0410/aidanh/ninja

echo "Change directory to group"
cd ${MYGROUP}

echo "Download source code and build scripts"
git clone --recursive https://github.com/NOAA-GFDL/MOM6-examples.git MOM6-examples

echo "Configure build scripts"
cd mom6-ninja-nci
./gen_build.sh

echo "Compile FMS library"
(cd shared && ./gen_build.sh && ${ninja})

echo "Compile MOM6 ocean-only"
(cd ocean_only_symmetric && ./gen_build.sh && ${ninja})


