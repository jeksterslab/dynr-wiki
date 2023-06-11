#!/bin/bash

set -e

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# dep.sh

apt_install                \
    libcurl4-openssl-dev   \
    libharfbuzz-dev        \
    libfribidi-dev         \
    libfontconfig1-dev     \
    build-essential        \
    cmake                  \
    libopenblas-dev        \
    liblapack-dev          \
    libarpack2-dev         \
    libsuperlu-dev         \
    libgsl-dev             \
    libarmadillo-dev       \
    libeigen3-dev

R -e "                     \
    install.packages(      \
        c(                 \
          'car',           \
          'deSolve',       \
          'devtools',      \
          'fda',           \
          'fds',           \
          'ggplot2',       \
          'knitr',         \
          'latex2exp',     \
          'magrittr',      \
          'MASS',          \
          'Matrix',        \
          'mice',          \
          'numDeriv',      \
          'plyr',          \
          'Rcpp',          \
          'RcppArmadillo', \
          'RcppGSL',       \
          'Rdpack',        \
          'remotes',       \
          'reshape2',      \
          'rmarkdown',     \
          'roxygen2',      \
          'Ryacas',        \
          'stringi',       \
          'testthat',      \
          'tibble',        \
          'tinytex',       \
          'xtable'         \
        ),                 \
        repos = 'https://packagemanager.rstudio.com/all/__linux__/jammy/latest' \
    )                                                                           \
"

R -e "                                                    \
    remotes::install_version(                             \
        package = 'roxygen2',                             \
        version = '5.0.1',                                \
        repos = c(CRAN = 'https://cran.rstudio.com')      \
    )                                                     \
"

R -e "                                                    \
    try(tinytex::install_tinytex())                       \
"

# master
git clone https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
