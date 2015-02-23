#!/bin/bash

# Some shell commands are dangerous - rm deletes files permamently, cp and mv
# silently overwrite destination files if they exist. To protect myself from
# my own mistakes I define "safe" versions of such commands.
#
# I could define aliases that shadow the original commands, but I think it
# wouldn't be good to get used to a non-default behaviour.

# I use trash-cli instead of rm (https://github.com/andreafrancia/trash-cli)
alias r='trash-put'  # puts files in system trash
alias m='\mv --backup=numbered'
alias c='\cp --backup=numbered'

# You may want to make sure that you won't accidentally use plain rm, mv or cp
# Bypass these aliases by prepending a slash, e.g. \rm file-without-hope
alias rm='echo "This is not the command you are looking for."; false'
alias mv='echo "This is not the command you are looking for."; false'
alias cp='echo "This is not the command you are looking for."; false'
