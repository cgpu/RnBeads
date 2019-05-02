#################################################################
# Dockerfile
#
# Version:          1.1
# Date              210419
# Update            added ghostscript, added tidyverse as base
# Software:         R
# Description:      RnBeads bioconductor's package 
# Website:          https://hub.docker.com/r/lnonell/rnbeads
# Tags:             None, for the moment
# Base Image:       R
#################################################################

FROM rocker/tidyverse:3.5.3

RUN apt-get update && apt-get install -y \
    r-cran-xml \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    ghostscript
ENV PATH=pkg-config:$PATH

RUN install2.r --error --deps TRUE \
    doParallel \
    && rm -rf /tmp/downloaded_packages/

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R");biocLite("Biobase");biocLite("biomaRt");biocLite("RnBeads");biocLite("RnBeads.hg38")'

