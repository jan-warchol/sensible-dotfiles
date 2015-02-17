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

git_version=$(git --version | cut -d' ' -f3)
if [[ $(echo $git_version | cut -d'.' -f1) < 2 ]]; then
    echo -en "You are using an old version of git ($git_version). I ${bold}"
    echo -en "strongly${normal} recommend installing the\nlatest version - "
    echo -e "it's much more user-friendly, and it really makes a difference."
    echo -e "On Debian-based systems you can do this with\n"
    echo "sudo add-apt-repository ppa:git-core/ppa"
    echo "sudo apt-get update"
    echo "sudo apt-get install git"
fi
