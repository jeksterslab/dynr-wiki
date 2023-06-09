#!/bin/bash

set -e

# ------------------------------------------------------------------------------
# Posit Cloud dynr Build
# Ivan Jacob Agaloos Pesigan
# ------------------------------------------------------------------------------

# install R packages -----------------------------------------------------------
Rscript -e "                                         \
    install.packages(                                \
        c(                                           \
            'devtools',                              \
            'remotes',                               \
            'tinytex',                               \
            'MASS',                                  \
            'Matrix',                                \
            'numDeriv',                              \
            'xtable',                                \
            'latex2exp',                             \
            'reshape2',                              \
            'plyr',                                  \
            'mice',                                  \
            'magrittr',                              \
            'fds',                                   \
            'fda',                                   \
            'car',                                   \
            'stringi',                               \
            'tibble',                                \
            'deSolve',                               \
            'Rdpack',                                \
            'Rcpp',                                  \
            'RcppArmadillo',                         \
            'RcppGSL',                               \
            'Ryacas',                                \
            'testthat',                              \
            'knitr',                                 \
            'rmarkdown',                             \
            'dynr'                                   \
        ),                                           \
        repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/__linux__/jammy/latest') \
    )                                                \
"

Rscript -e "                                         \
    remotes::install_version(                        \
        package = 'roxygen2',                        \
        version = '5.0.1',                           \
        repos = c(CRAN = 'https://cran.rstudio.com') \
    )                                                \
"

Rscript -e "                                         \
    try(tinytex::install_tinytex())                  \
"

# build dynr -------------------------------------------------------------------
git clone https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
rm -rf build.sh
