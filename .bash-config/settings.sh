#!/bin/bash

# enable autocompletion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# make "**" match all files in all levels of subdirectories
shopt -s globstar

# check the window size after each command and update values of LINES and COLUMNS
shopt -s checkwinsize



# HISTORY

# save whole history
export HISTFILESIZE=-1
export HISTSIZE=-1

# don't store duplicated commands in history
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# disable terminal flow control key binding, so that ^S will search history forward
stty -ixon
