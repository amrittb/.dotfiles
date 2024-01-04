#!/bin/bash
#
# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

# Install required stuff
brew install ripgrep

# Set symlink
unlink ~/.config/nvim
ln -s ${THIS_DIR}/.config/nvim ~/.config/nvim
