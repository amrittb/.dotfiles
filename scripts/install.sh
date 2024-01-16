#!/bin/bash

THIS_FILE=$(realpath ${BASH_SOURCE[0]})
THIS_DIR="$(dirname -- ${THIS_FILE})"

unlink ~/.local/bin/tmux-sessionizer
ln -s ${THIS_DIR}/.local/bin/tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer 