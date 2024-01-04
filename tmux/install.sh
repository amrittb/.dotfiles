#!/bin/bash

# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

# Install required stuff
brew install tmux

# powerlevel10k
PLUGIN_PATH="$HOME/.tmux/plugins/tpm"
if [ ! -d "${PLUGIN_PATH}" ]; then
  echo "Installing tpm"
  git clone --depth=1 https://github.com/tmux-plugins/tpm ${PLUGIN_PATH} 
fi


# Set symlink
unlink ~/.tmux.conf
ln -s ${THIS_DIR}/.tmux.conf ~/.tmux.conf

echo "Run <prefix> + I to install tmux plugins"
