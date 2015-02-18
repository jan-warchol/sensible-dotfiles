#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f "$HOME/.dotfiles-repo-path" ]; then
    export DOTFILES_REPO=$(cat "$HOME/.dotfiles-repo-path")
    alias dotfiles='git --work-tree="$HOME" --git-dir="$DOTFILES_REPO"'
else
    echo "ERROR: your dotfiles repository isn't set up properly -"
    echo "       .dotfiles-repo-path file is missing."
fi

# Source configuration files from $HOME/.bash-config/ if they exist
configs=$HOME/.bash-config
if [[ -d $configs && $(ls ${configs}/*.sh 2>/dev/null) ]]; then
    for file in $HOME/.bash-config/*.sh; do
        . $file
    done
fi
