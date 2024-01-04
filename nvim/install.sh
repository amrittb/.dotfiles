#!/bin/bash
# Install required stuff
brew install ripgrep

# Set base path
BASE="dirname $(realpath $0)"

# Set symlink
unlink ~/.config/nvim
ln -s ${BASE}/.config/nvim ~/.config/nvim
