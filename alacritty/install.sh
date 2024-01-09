#!/bin/bash

# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

BIN_DIR="${THIS_DIR}/../bin"
source "${BIN_DIR}/brew.sh"

# Install required stuff
echo "Installing alacritty"
brewInCask alacritty

# Set symlink
echo "Recreating symlinks"
unlink ~/.config/alacritty
ln -s ${THIS_DIR}/.config/alacritty ~/.config/alacritty

