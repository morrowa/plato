#!/bin/bash

. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

export BZIP2_CFLAGS="-I../bzip2"
export BZIP2_LIBS="-L../bzip2 -lbz2"
export LIBPNG_CFLAGS="-I../libpng"
export LIBPNG_LIBS="-L../libpng/.libs -lpng16"

./configure ${CONFIGURE_FLAGS} --with-zlib=yes --with-png=yes \
            --with-bzip2=yes --with-harfbuzz=no --disable-static && make
