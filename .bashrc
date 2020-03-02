# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# Load stuff specific to Macs if appropriate
[ `uname` = Darwin ] && source .osx-compatibility.sh

# list directories before files (if installed version of ls allows this)
if man ls | grep group-directories-first >&/dev/null; then
    alias ls='ls --color=auto --group-directories-first'
fi

# default settings for less. You may also want to disable line wrapping with -S
export LESS='-MRi#8j.5'
#             |||| `- center on search matches
#             |||`--- scroll horizontally 8 columns at a time
#             ||`---- case-insensitive search unless pattern contains uppercase
#             |`----- parse color codes
#             `------ show more information in prompt

# default settings for grep
alias grep='grep --color --binary-files=without-match --exclude-dir .git'



# ALIASES

# common ls aliases
alias l='ls -FB'  # --classify --ignore-backups
alias la='ls -FA'  # --classify --almost-all
alias ll='ls -Flah'  # --classify --all --human-readable'

# this will color matches even when output to a non-tty (e.g. piped to less)
alias grep3='grep --color=always --line-number --context=3'

# Some commands are so common that they deserve one-letter shortcuts :)
alias g='git'
alias v='vim'
alias L='less'

# Aliasing 'g' to 'git' wouldn't be useful without autocompletion.
complete -o default -o nospace -F _git g
. /usr/share/bash-completion/completions/git 2> /dev/null

# Instead of rm, which deletes files permanently, I prefer to use trash-cli
# (github.com/andreafrancia/trash-cli) which moves files to system trash.
alias tp='trash-put'
#alias rm='echo "This is not the footgun you are looking for."; false'

# Show a desktop notification when a command finishes. Use like this:
#   sleep 5; alert
function alert() {
    if [ $? = 0 ]; then icon=terminal; else icon=error; fi
    last_cmd="$(history | tail -n1 | sed 's/^\s*[0-9]*\s*//' | sed 's/;\s*alert\s*$//')"
    notify-send -i $icon "$last_cmd"
}



# SETTINGS

# enable autocompletion and make it case-insensitive
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
bind "set completion-ignore-case on"

# let aliases work after sudo (see http://askubuntu.com/a/22043)
alias sudo='sudo '

# cd to a dir just by typing its name (requires bash > 4.0), autocorrect typos
[ ${BASH_VERSION:0:1} -ge 4 ] && shopt -s autocd
shopt -s cdspell

# shell history is useful, let's have more of it
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups   # don't store duplicated commands
shopt -s histappend   # don't overwrite history file after each session

# let Ctrl-O open ranger, a console file manager (http://nongnu.org/ranger/):
bind '"\C-o":"ranger\C-m"'
# this wrapper lets bash automatically change current directory to the last one
# visited inside ranger.  (Use "cd -" to return to the original directory.)
function ranger {
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" && cd -- "$(cat "$tempfile")"
    rm -f -- "$tempfile"
}



# PROMPT

# Colored prompt makes it easier to visually parse terminal output. Note that
# using \[ and \] is necessary to prevent weird behavior (lines overlapping).

# I'm using bright colors because in most terminal palettes the "normal" ones
# (\e[35m, \e[34m and \e[36m) are too dim - feel free to adjust.
if [ -n "$SSH_CONNECTION" ]; then  # connected through SSH?
    usercolor="\[\e[95m\]"  # yes -> magenta
else
    usercolor="\[\e[94m\]"  # no -> blue
fi
pathcolor="\[\e[96m\]"  # cyan path
resetcolors="\[\e[0m\]"

# $(__git_ps1) displays git repository status in the prompt - very handy!
# Read more: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="verbose git"

# we don't want "command not found" errors when __git_ps1 is not installed
type __git_ps1 &>/dev/null || function __git_ps1 () { true; }

export PS1="${usercolor}\u@\h${pathcolor} \w${resetcolors}\$(__git_ps1)\n\\$ "

