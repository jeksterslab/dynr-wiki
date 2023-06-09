#!/bin/bash

set -e

# ------------------------------------------------------------------------------
# Posit Cloud dynr Build (arma branch)
# Ivan Jacob Agaloos Pesigan
# ------------------------------------------------------------------------------

# build dynr -------------------------------------------------------------------
git clone -b arma https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
rm -rf build.sh
