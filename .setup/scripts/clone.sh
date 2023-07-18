#!/bin/bash

git clone git@github.com:jeksterslab/dynr-wiki.git
rm -rf "$PWD.git"
mv dynr-wiki/.git "$PWD"
rm -rf dynr-wiki
