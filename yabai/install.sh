#!/bin/bash

# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

# Install required stuff
brew install koekeishiya/formulae/yabai

# Set symlink
unlink ~/.config/yabai
ln -s ${THIS_DIR}/.config/yabai ~/.config/yabai
