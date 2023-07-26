#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(readlink -f "${0}")")"
PANDOC_DATA_DIR="$HOME/.local/share/pandoc"
rm -rf "$PANDOC_DATA_DIR"
ln -s "${SCRIPT_DIR}" "$PANDOC_DATA_DIR"
