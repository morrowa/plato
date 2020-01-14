#!/bin/bash

. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

./configure ${CONFIGURE_FLAGS} && make
