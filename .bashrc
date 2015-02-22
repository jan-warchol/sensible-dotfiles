#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# source all *.sh files from $HOME/.bash-config/
configs=$HOME/.bash-config
if [[ -d $configs && $(ls ${configs}/*.sh 2>/dev/null) ]]; then
    for file in $HOME/.bash-config/*.sh; do
        . $file
    done
fi
