#!/bin/bash

rm -rf ~/.local/share/pandoc
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ln -s "${SCRIPT_DIR}" ~/.local/share/pandoc