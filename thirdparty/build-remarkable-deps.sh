#!/bin/bash

./download-remarkable.sh "$@"
./build-remarkable.sh "$@"
cd ..
cd src/wrapper
./build-remarkable.sh
cd ../..

[ -e libs ] || mkdir libs

cp thirdparty/bzip2/libbz2.so libs

cp thirdparty/libpng/.libs/libpng16.so libs
cp thirdparty/libjpeg/.libs/libjpeg.so libs
cp thirdparty/openjpeg/build/bin/libopenjp2.so libs
cp thirdparty/jbig2dec/.libs/libjbig2dec.so libs

cp thirdparty/freetype2/objs/.libs/libfreetype.so libs
cp thirdparty/harfbuzz/src/.libs/libharfbuzz.so libs

cp thirdparty/djvulibre/libdjvu/.libs/libdjvulibre.so libs
cp thirdparty/mupdf/build/release/libmupdf.so libs
cp src/wrapper/libmupdfwrapper.so libs
