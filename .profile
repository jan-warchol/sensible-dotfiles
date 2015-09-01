# Bash loads .profile for login shells and .bashrc for non-login shells.
# Usually you want them to do the same.
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
