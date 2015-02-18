#!/bin/bash

# Some commands are so common that they deserve one-letter shortcuts :)
alias g='git'
alias v='vim'

# Of course such aliases wouldn't be very useful if they didn't have
# proper autocompletion.  Doing this is a bit tricky and I'm not sure
# I did it 100% right, but it seems to work.
# In particular, bash autocompletion behaviour changed somewhere around
# version 4.3 - older versions don't have _completion_loader function
# defined (and they don't need it to make autocompletion work o_O).

# See also
# http://nuclearsquid.com/writings/git-new-workdir/
# http://stackoverflow.com/questions/20032764/how-to-use-bash-completion-functions-that-are-defined-on-the-fly

complete -o default -o nospace -F _git git g
if [ -n "$(type -t _completion_loader)" ]; then
    _completion_loader git
fi
