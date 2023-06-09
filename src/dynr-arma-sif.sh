#!/bin/bash

# ------------------------------------------------------------------------------
# Apptainer dynr SIF (arma branch)
# Ivan Jacob Agaloos Pesigan
# ------------------------------------------------------------------------------

set -e

git clone https://github.com/jeksterslab/docker-dynr-arma-rocker.git
cd docker-dynr-arma-rocker
make
