# enable autocompletion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# make autocompletion case-insensitive
bind "set completion-ignore-case on"

# cd to a dir just by typing its name (requires bash > 4.0), autocorrect typos
shopt -s autocd
shopt -s cdspell

# shell history is very useful, so let's make sure we can harness its full power
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups   # don't store duplicated commands
shopt -s histappend   # don't overwrite history file after each session

# disable useless flow control binding, allowing Ctrl-S to search history forward
stty -ixon
