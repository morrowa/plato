#!/bin/bash

. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

ZLIB_DIR=../zlib
export CPPFLAGS="${CPPFLAGS} -I${ZLIB_DIR}"
export LDFLAGS="${LDFLAGS} -L${ZLIB_DIR}"

./configure ${CONFIGURE_FLAGS} && make
