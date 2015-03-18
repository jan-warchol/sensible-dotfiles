# Some shell commands are dangerous - rm deletes files permamently, cp and mv
# silently overwrite destination files if they exist. To protect myself from
# my own mistakes I define "safe" versions of such commands.

# I could define aliases that shadow the original commands, but I think it
# wouldn't be good to get used to a non-default behaviour.

# Move files to system trash - much safer than removing permamently with rm
# (install trash-cli from https://github.com/andreafrancia/trash-cli)
alias tp='trash-put'

alias mw='\mv --backup=numbered'
alias kp='\cp --backup=numbered'

# You may want to make sure that you won't accidentally use plain rm, mv or cp
# Bypass these aliases by prepending a slash, e.g. \rm file-without-hope
#alias rm='echo "This is not the command you are looking for."; false'
#alias mv='echo "This is not the command you are looking for."; false'
#alias cp='echo "This is not the command you are looking for."; false'
