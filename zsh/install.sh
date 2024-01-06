#!/bin/bash

# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

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


brewIn() {
  if brew ls --versions "$1"; then echo "$1 already installed."; else brew install "$1"; fi
}

# Install fzf and eza
echo "Installing required tools"
brewIn fzf
brewIn eza

# Add symlinks
echo "Cleaning symlinks"
[ -f ~/.zshrc ] && unlink ~/.zshrc
[ -f ~/.p10k.zsh ] && unlink ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && unlink ~/.fzf.zsh
[ -f ~/.fzf.bash ] && unlink ~/.fzf.bash

echo "Creating symlinks"
[ ! -f ~/.zshrc ] && ln -s ${THIS_DIR}/.zshrc ~/.zshrc
[ ! -f ~/.p10k.zsh ] && ln -s ${THIS_DIR}/.p10k.zsh ~/.p10k.zsh
[ ! -f ~/.fzf.zsh ] && ln -s ${THIS_DIR}/.fzf.zsh ~/.fzf.zsh
[ ! -f ~/.fzf.bash ] && ln -s ${THIS_DIR}/.fzf.bash ~/.fzf.bash
