#!/bin/bash

echo "Installing everything"


# Set base path
THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

if [ ! -d "$HOME/.config" ]; then
  echo "Creating XDG_CONFIG_HOME at $HOME/.config"
  mkdir $HOME/.config
fi

# Checks if Homebrew is installed
brew --version > /dev/null 2>&1
ret=$?
if [ $ret != 0 ]; then
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ret=$?
  if [ $ret != 0 ]; then
    exit $ret
  fi
fi

/bin/bash alacritty/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

/bin/bash zsh/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

/bin/bash tmux/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

/bin/bash nvim/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

/bin/bash yabai/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

/bin/bash skhd/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

/bin/bash scripts/install.sh
ret=$?
if [ $ret != 0 ]; then
  exit $ret
fi

