# enable autocompletion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# make autocompletion case-insensitive
bind "set completion-ignore-case on"

# cd to a dir just by typing its name (requires bash > 4.0), autocorrect typos
shopt -s autocd
shopt -s cdspell



# HISTORY

# save LOTS of history
export HISTFILESIZE=10000000
export HISTSIZE=10000000

# don't store duplicated commands in history
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# disable terminal flow control key binding, so that ^S will search history forward
stty -ixon
