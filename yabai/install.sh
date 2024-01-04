#!/bin/bash
# Install required stuff
brew install koekeishiya/formulae/yabai

# Set base path
BASE="dirname $(realpath $0)"

# Set symlink
unlink ~/.config/yabai
ln -s ${BASE}/.config/yabai ~/.config/yabai
