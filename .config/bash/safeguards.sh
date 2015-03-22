# Some shell commands are dangerous - rm deletes files permamently, cp and mv
# silently overwrite destination files if they exist. To protect myself from
# my own mistakes I define "safe versions" of such commands.

# Instead of rm, I use trash-cli (https://github.com/andreafrancia/trash-cli)
# which moves files to system trash.  It can be installed with pip or apt-get.
alias tp='trash-put'

alias mw='\mv --backup=numbered'
alias kp='\cp --backup=numbered'

# I could use aliases to shadow the original commands, but I think it
# wouldn't be good to get used to a non-default behaviour.
