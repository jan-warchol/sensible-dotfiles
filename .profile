# Bash loads .profile for login shells and .bashrc for non-login shells.
# As Linux terminal emulators usually use non-login shells and Mac ones
# use a login shell, I decided to just source .bashrc in .profile.
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
