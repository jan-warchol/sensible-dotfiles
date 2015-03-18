# Aliases such as 'g' for 'git' wouldn't be very useful if they didn't
# have autocompletion.  Doing this is a bit tricky and I'm not sure
# I did it 100% right, but it seems to work.

complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git dotfiles
# make sure the autocompletion function (`_git`) is loaded
. /usr/share/bash-completion/completions/git 2> /dev/null
