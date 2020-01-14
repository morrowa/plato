#!/bin/bash

# not sure why these two lines existed - ignoring until it becomes obvious
# [ -e thirdparty/README ] && rm -rf thirdparty/*
# [ -e .gitattributes ] && rm .git*


# must be run before we start cross-compiling since it makes host-only tools
make verbose=yes generate

# BEGIN CROSS-COMPILE
. /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi

BUILD_KIND=${1:-release}
make verbose=yes USE_SYSTEM_LIBS=yes OS=remarkable "$BUILD_KIND"

$CC -Wl,--gc-sections -o build/"$BUILD_KIND"/libmupdf.so $(find build/"$BUILD_KIND" -name '*.o' | grep -Ev '(SourceHanSerif-Regular|DroidSansFallbackFull|NotoSerifTangut|color-lcms)') -lm -L../freetype2/objs/.libs -lfreetype -L../harfbuzz/src/.libs -lharfbuzz -L../jbig2dec/.libs -ljbig2dec -L../libjpeg/.libs -ljpeg -L../openjpeg/build/bin -lopenjp2 -lz -shared -Wl,-soname -Wl,libmupdf.so -Wl,--no-undefined
