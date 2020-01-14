#!/bin/bash

. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

TARGET_OS=remarkable CFLAGS="${CFLAGS} -I../../thirdparty/mupdf/include" ./build.sh
