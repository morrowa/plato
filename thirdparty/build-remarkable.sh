#!/bin/bash

set -e

declare -a packages=(bzip2 libpng libjpeg openjpeg jbig2dec freetype2 harfbuzz djvulibre mupdf)

for name in "${@:-${packages[@]}}" ; do
	echo "Building ${name}."
	cd "$name"
	[ -e remarkable.patch ] && patch -p 1 < remarkable.patch
	./build-remarkable.sh
	cd ..
done
