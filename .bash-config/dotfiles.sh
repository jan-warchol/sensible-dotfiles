#!/bin/bash

# Define `dotfiles` command for managing the dotfiles repository.

if [ -f "$HOME/.dotfiles-repo-path" ]; then
    export DOTFILES_REPO=$(cat "$HOME/.dotfiles-repo-path")
    dotfiles() {
        if [ "$1" = clean ]; then
            echo "You should NEVER USE 'git clean' on dotfiles repository."
            echo "'git clean' is used for removing untracked files from a"
            echo "repository - in case of dotfiles these untracked files"
            echo "would be the whole content of your HOME directory."
        else
            git --work-tree="$HOME" --git-dir="$DOTFILES_REPO" "$@"
        fi
    }
else
    echo "ERROR: your dotfiles repository isn't set up properly -"
    echo "       .dotfiles-repo-path config file is missing. This"
    echo "       file should contain the path to dotfiles git-dir."
fi

# see autocompleted-shortcuts.sh
complete -o default -o nospace -F _git git dotfiles
if [ -n "$(type -t _completion_loader)" ]; then
    _completion_loader git
fi
