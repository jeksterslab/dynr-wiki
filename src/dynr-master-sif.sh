#!/bin/bash

# ------------------------------------------------------------------------------
# Apptainer dynr SIF (master branch)
# Ivan Jacob Agaloos Pesigan
# ------------------------------------------------------------------------------

set -e

git clone https://github.com/jeksterslab/docker-dynr-rocker.git
cd docker-dynr-rocker
make
