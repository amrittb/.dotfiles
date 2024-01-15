#!/bin/bash

# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

BIN_DIR="${THIS_DIR}/../bin"
source "${BIN_DIR}/brew.sh"

# Install ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install required plugins
# powerlevel10k
PLUGIN_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "${PLUGIN_PATH}" ]; then
  echo "Installing powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${PLUGIN_PATH}
fi

# zsh-syntax-highlighting
PLUGIN_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [ ! -d "${PLUGIN_PATH}" ]; then
  echo "Installing zsh-syntax-highlighting"
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${PLUGIN_PATH}
fi

# zsh-autosuggestions
PLUGIN_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d "${PLUGIN_PATH}" ]; then
  echo "Installing zsh-autosuggestions"
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${PLUGIN_PATH}
fi

# Install fzf and eza
echo "Installing required stuff"
brewIn fzf
brewIn eza

# Install sdkman
if [ ! -d "$HOME/.sdkman" ]; then
  echo "Installing sdkman"
  curl -s "https://get.sdkman.io" | bash
fi

source $HOME/.sdkman/bin/sdkman-init.sh

# Installing Java
echo "Installing SDKs"
sdk install java 8.0.392-amzn
sdk install java 11.0.21-amzn
sdk install java 17.0.9-amzn

# Add symlinks
echo "Recreating symlinks"
unlink ~/.zshrc
unlink ~/.p10k.zsh
unlink ~/.fzf.zsh
ln -s ${THIS_DIR}/.zshrc ~/.zshrc
ln -s ${THIS_DIR}/.p10k.zsh ~/.p10k.zsh
ln -s ${THIS_DIR}/.fzf.zsh ~/.fzf.zsh
