#!/usr/bin/env bash
set -euo pipefail

# Patches deps/red4ext.sdk for case-sensitive filesystems (Linux).
# Upstream includes RED4ext/rtti/* but the directory on disk is RED4ext/RTTI/*,
# which only works on Windows' case-insensitive FS.
# Run after `git submodule update` to re-apply the fix.

cd "$(dirname "$(readlink -f "$0")")"

SDK="deps/red4ext.sdk"

files=(
  "$SDK/include/RED4ext/RTTITypes.hpp"
  "$SDK/include/RED4ext/RTTI/IType.hpp"
  "$SDK/include/RED4ext/RTTI/IType-inl.hpp"
  "$SDK/src/RTTI/IType.cpp"
)

for f in "${files[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "skip (not found): $f"
    continue
  fi
  sed -i 's|<RED4ext/rtti/|<RED4ext/RTTI/|g' "$f"
  echo "patched: $f"
done
