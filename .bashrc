#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source configuration files from $HOME/.bash-config/ if they exist
configs=$HOME/.bash-config
if [[ -d $configs && $(ls ${configs}/*.sh 2>/dev/null) ]]; then
    for file in $HOME/.bash-config/*.sh; do
        . $file
    done
fi
