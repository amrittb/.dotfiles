#!/bin/bash

# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

BIN_DIR="${THIS_DIR}/../bin"
source "${BIN_DIR}/brew.sh"

# Install required stuff
echo "Installing required stuff"
brewIn tmux

# powerlevel10k
PLUGIN_PATH="$HOME/.tmux/plugins/tpm"
if [ ! -d "${PLUGIN_PATH}" ]; then
  echo "Installing tpm"
  git clone --depth=1 https://github.com/tmux-plugins/tpm ${PLUGIN_PATH} 
fi

# Set symlink
echo "Recreating symlinks"
unlink ~/.tmux.conf
ln -s ${THIS_DIR}/.tmux.conf ~/.tmux.conf

echo "Run <prefix> + I in your tmux session install tmux plugins"
