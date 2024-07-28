#!/usr/bin/env bash
set -ex

# get meson to find pkg-config when cross compiling
export PKG_CONFIG=$BUILD_PREFIX/bin/pkg-config

meson ${MESON_ARGS} \
    --wrap-mode=nofallback \
    --Dbuildtype=release \
    --prefix="${PREFIX}" \
    -Dlibdir=lib \
    builddir .

ninja -C builddir -j${CPU_COUNT}
ninja -C builddir test
ninja -C builddir install
