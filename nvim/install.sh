#!/bin/bash
#
# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

BIN_DIR="${THIS_DIR}/../bin"
source "${BIN_DIR}/brew.sh"

# Install required stuff
echo "Installing required stuff"
brewIn neovim
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

brewIn ripgrep
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

# Set symlink
echo "Recreating symlinks"
unlink ~/.config/nvim
ln -s ${THIS_DIR}/.config/nvim ~/.config/nvim
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

