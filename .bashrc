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
