#!/bin/bash

brewIn() {
  if brew ls --versions "$1"; then echo "$1 already installed."; else brew install "$1"; fi
}

brewInCask() {
  if brew ls --versions "$1"; then echo "$1 already installed."; else brew install --cask "$1"; fi
}

