#!/bin/bash

. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

[ -d build ] && rm -Rf build

mkdir build
cd build || exit 1

cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_CODEC=off -DBUILD_STATIC_LIBS=off .. && make

cd .. || exit 1
cp build/src/lib/openjp2/opj_config.h src/lib/openjp2
