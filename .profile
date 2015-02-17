# usually you want your .profile to do what .bashrc does
# (assuming your shell is bash)
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
