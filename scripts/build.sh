#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# Linux is not hardware/host-tested. Install CLI 1.5.1 and core 1.8.8
# into this isolated directory; never use modified global libraries.
export ARDUINO_DIRECTORIES_DATA="$ROOT/.state/linux-data"
export ARDUINO_DIRECTORIES_USER="$ROOT/.state/user"
export ARDUINO_DIRECTORIES_DOWNLOADS="$ROOT/.state/downloads"
CLI="${ARDUINO_CLI:-arduino-cli}"
mkdir -p "$ARDUINO_DIRECTORIES_USER" "$ARDUINO_DIRECTORIES_DOWNLOADS"
"$CLI" version | grep '1.5.1'
"$CLI" core list | grep -E 'arduino:avr[[:space:]]+1.8.8'
"$CLI" compile --clean --fqbn arduino:avr:mega \
 --build-path "$ROOT/.build/linux" --output-dir "$ROOT/.build/linux/output" \
 --library "$ROOT/libraries/MCUFRIEND_kbv" \
 --library "$ROOT/libraries/Adafruit_GFX_Library" \
 --library "$ROOT/libraries/Adafruit_BusIO" "$ROOT/color_test"
sha256sum "$ROOT/.build/linux/output/color_test.ino.hex"
