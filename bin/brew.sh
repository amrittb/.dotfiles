#!/bin/bash

brewIn() {
  if brew ls --versions "$1"; then echo "$1 already installed."; else brew install "$1"; fi
}


