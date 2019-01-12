#################################################################
# Dockerfile
#
# Version:          1
# Date              110118
# Software:         R
# Description:      RnBeads bioconductor's package 
# Website:          https://hub.docker.com/r/lnonell/rnbeads
# Tags:             None, for the moment
# Base Image:       R
#################################################################

FROM r-base:3.5.1

RUN apt-get update && apt-get install -y \
    r-cran-xml \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev
ENV PATH=pkg-config:$PATH

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R");biocLite("Biobase");biocLite("biomaRt");biocLite("RnBeads")'

##That's all for the moment
