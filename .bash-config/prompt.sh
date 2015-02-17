#!/bin/bash

# First, some color definitions.  Colored prompt stands out in the sea
# of text, which makes it much easier to find things in your terminal.
normal="\e[00m"
bold="\e[1;37m"

red="\e[00;31m"
green="\e[00;32m"
yellow="\e[00;33m"
blue="\e[00;34m"
violet="\e[00;35m"
cyan="\e[00;36m"

boldred="\e[1;31m"
boldgreen="\e[1;32m"
boldyellow="\e[1;33m"
boldblue="\e[1;34m"
boldviolet="\e[1;35m"
boldcyan="\e[1;36m"

# Use different coloring when I'm logged into a different machine via ssh.
usercolor=${violet}
if [ -z "$SSH_CONNECTION" ]; then
    hostcolor=${usercolor}
else
    hostcolor=${blue}
fi

# $(__git_ps1) displays git repository status in the prompt.
# This is the single best customization that I had ever made to my shell,
# period.  It's extremely convenient, saved me lots of time and actually
# prevented some serious mistakes - I LOVE IT!!  See the documentation at
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

export PS1="${usercolor}\u${hostcolor}@\h ${cyan}\w${normal}\$(__git_ps1)\n\\$ "
export PS4='${bold}>>> ${normal}'
