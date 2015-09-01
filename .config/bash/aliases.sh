# redefine some commands by adding "default" settings
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias less='less --RAW-CONTROL-CHARS'  # parses color codes!

# this will color matches even when output to a non-tty (e.g. piped to less)
alias grp='grep --line-number --color=always'

# common ls aliases
alias l='ls --file-type --ignore-backups'
alias la='ls --almost-all --file-type'
alias ll='ls -l --human-readable --almost-all --file-type'
alias ld='ll --group-directories-first'

# Some commands are so common that they deserve one-letter shortcuts :)
alias g='git'
alias v='vim'
alias L='less'  # typing |L is convenient, especially using left shift

# Show a desktop notification when a command finishes. Use like this:
#   sleep 5; alert
alert() {
    if [ $? = 0 ]; then icon=terminal; else icon=error; fi
    last_cmd="$(history | tail -n1 | sed 's/^\s*[0-9]*\s*//' | sed 's/;\s*alert\s*$//')"
    notify-send -i $icon "$last_cmd"
}

# let aliases work after sudo (see http://askubuntu.com/a/22043)
alias sudo='sudo '
