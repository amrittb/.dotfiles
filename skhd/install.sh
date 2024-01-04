#!/bin/bash
# Install required stuff
brew install koekeishiya/formulae/skhd

# Set base path
BASE="dirname $(realpath $0)"

# Set symlink
unlink ~/.config/skhd
ln -s ${BASE}/.config/skhd ~/.config/skhd
