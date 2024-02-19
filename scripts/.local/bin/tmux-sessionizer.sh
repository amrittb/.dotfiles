#!/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    directories=""

    if [ -d "${HOME}/Projects" ]; then
        directories=$(printf "${directories}\n$(find ~/Projects -mindepth 1 -maxdepth 2 -type d)")
    fi

    if [ -d "${HOME}/.dotfiles" ]; then
        directories=$(printf "${directories}\n${HOME}/.dotfiles")
    fi

    if [ -d "${HOME}/Obsidian/rakuten-vault" ]; then
        directories=$(printf "${directories}\n${HOME}/Obsidian/rakuten-vault")
    fi

    if [ -d "${HOME}/Private/Growth/Professional/Projects" ]; then
        directories=$(printf "${directories}\n$(find ${HOME}/Private/Growth/Professional/Projects -mindepth 1 -maxdepth 1 -type d)")
    fi

    if [ -d "${HOME}/Private/Growth/Personal/personal-vault" ]; then
        directories=$(printf "${directories}\n${HOME}/Private/Growth/Personal/personal-vault")
    fi

    selected=$(echo "${directories}" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
