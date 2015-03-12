# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# define `dotfiles` command for managing the dotfiles repository
if [ -f "$HOME/.config/dotfiles-git-dir" ]; then
    export DOTFILES_GIT_DIR=$(cat "$HOME/.config/dotfiles-git-dir")
    dotfiles() {
        if [[ "$@" == *clean* ]]; then
            echo "NEVER USE 'git clean' on the dotfiles repository!"
            echo "It would delete data from your HOME directory."
        else
            git --work-tree="$HOME" --git-dir="$DOTFILES_GIT_DIR" "$@"
        fi
    }
else
    echo "ERROR: your dotfiles repository isn't set up correctly -"
    echo "       ~/.config/dotfiles-git-dir file is missing. This"
    echo "       file should contain the path to dotfiles git-dir."
fi

# source *.sh configuration files
configs="$HOME/.config/bash/"
if [[ -d "${configs}" && $(ls "${configs}"/*.sh 2>/dev/null) ]]; then
    for f in "${configs}"/*.sh; do
        . "$f"
    done
fi
