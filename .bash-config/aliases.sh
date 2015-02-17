#!/bin/bash

# shortcuts for very commonly used commands
alias g='git'
alias s='sudo'
alias v='vim'
# make autocompletion work with 'g' and 's' aliases (there is no special autocompletion for vim)
# - see http://nuclearsquid.com/writings/git-new-workdir/ and
# http://stackoverflow.com/questions/20032764/how-to-use-bash-completion-functions-that-are-defined-on-the-fly
complete -o default -o nospace -F _git git g
complete -o default -o nospace -F _sudo sudo s
_completion_loader git
_completion_loader sudo

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
