#!/bin/bash

. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

JPEG_DIR=$(realpath ../libjpeg)

./autogen.sh ${CONFIGURE_FLAGS} --disable-xmltools --disable-desktopfiles --with-jpeg=${JPEG_DIR} && make
