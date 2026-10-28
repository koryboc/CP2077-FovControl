#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

BUILD_DIR="build"
BUILD_TYPE="${BUILD_TYPE:-Release}"

if [[ "${1:-}" == "clean" ]]; then
  rm -rf "$BUILD_DIR"
fi

if [[ ! -f "$BUILD_DIR/build.ninja" ]]; then
  cmake -B "$BUILD_DIR" -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=xwin-toolchain.cmake \
    -DCMAKE_BUILD_TYPE="$BUILD_TYPE"
fi

cmake --build "$BUILD_DIR"

echo
echo "Build artifact:"
ls -lh bin/red4ext/plugins/FovControl/FovControl.dll
