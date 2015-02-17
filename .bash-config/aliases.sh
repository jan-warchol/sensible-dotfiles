#!/bin/bash

# redefine some commands by adding "default" settings
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='rgrep --color=auto'
alias less='less --RAW-CONTROL-CHARS'  # parses color codes!
alias mkdir='mkdir --parents'

# more ls aliases
alias l='ls --file-type --ignore-backups'
alias la='ls --almost-all --file-type'
alias ll='ls -l --human-readable --almost-all --file-type'
alias lld='ll --group-directories-first'

# coloful grep (will color matches even when piped to less)
alias grp='grep --line-number --color=always'
alias rgp='rgrep --line-number --color=always'
alias egp='egrep --line-number --color=always'

# miscellaneous
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias ,='less --chop-long-lines'
mdc() { mkdir --parents "$@"; cd "$@"; }

# Show a notification when a command finishes - use like this:  sleep 10; alert
# Taken from Ubuntu's default .bashrc.
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
