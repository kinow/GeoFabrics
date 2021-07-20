FROM debian:unstable-slim

RUN apt-get update \
    && apt-get -y --no-install-recommends install software-properties-common \
       build-essential \
       gdal-bin \
       libnetcdf-dev \
       pdal \
       libpdal-dev \
       wget \
    && rm -rf /var/lib/apt/lists/*

RUN pdal-config --version \
	&& gdalinfo --formats \
	&& nc-config --all

COPY get-pythons.sh /bin/get-pythons.sh

RUN /bin/get-pythons.sh

VOLUME ["/usr/src/geofabrics"]

RUN useradd -u 8888 ci
USER ci

WORKDIR /usr/src/geofabrics
