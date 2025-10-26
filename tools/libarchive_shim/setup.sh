#!/usr/bin/env bash
set -euo pipefail

# Install the shim into a writable prefix.  This is primarily useful in
# sandboxed environments (like GitHub Actions) where installing the system
# libarchive package is not possible.

PREFIX="${1:-$(pwd)/toolchain-deps}"
BIN_DIR="$PREFIX/bin"
PKG_DIR="$PREFIX/lib/pkgconfig"

mkdir -p "$BIN_DIR" "$PKG_DIR"
cp "$(dirname "$0")/bsdtar" "$BIN_DIR/bsdtar"
chmod +x "$BIN_DIR/bsdtar"
cp "$(dirname "$0")/libarchive.pc" "$PKG_DIR/libarchive.pc"

printf 'Installed libarchive shim into: %s\n\n' "$PREFIX"
printf '%s\n' 'To make the shim visible to build scripts, export the following environment'
printf '%s\n\n' 'variables before running the PSP toolchain bootstrap:'
printf '  export PATH="%s:$PATH"\n' "$BIN_DIR"
printf '  export PKG_CONFIG_PATH="%s:${PKG_CONFIG_PATH:-}"\n' "$PKG_DIR"
printf '\n'
