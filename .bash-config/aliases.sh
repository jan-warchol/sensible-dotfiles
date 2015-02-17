#!/bin/bash

# redefine some commands
alias df='df --human-readable'
alias grep='grep --line-number --color=always'
alias rgrep='rgrep --line-number --color=always'
alias ls='ls --color=auto'
alias mkdir='mkdir --parents'

# more ls aliases
alias l='ls --file-type --ignore-backups'
alias la='ls --almost-all --file-type'
alias ll='ls -l --human-readable --almost-all --file-type'
alias lld='ll --group-directories-first'

# Show a notification when a command finishes (taken from Ubuntu's default .bashrc).
# Use by appending to the command after a semicolon:  sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# other
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias ,='less --RAW-CONTROL-CHARS --chop-long-lines' # parses color codes!
mdc() { mkdir --parents "$@"; cd "$@"; }
alias sagi='sudo apt-get install'
