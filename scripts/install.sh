#!/bin/bash

THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

# Installing sessionizer
echo "Installing sessionizer"
if [ ! -d "$HOME/.local/bin/" ]; then
  mkdir -p "$HOME/.local/bin/"
fi
unlink ~/.local/bin/tmux-sessionizer
ln -s ${THIS_DIR}/.local/bin/tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer 
