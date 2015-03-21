#!/bin/bash

# Install dotfiles together with some additional software -
# useful for provisioning a completely new computer (or a VM).
#
# To use with Vagrant, add this to your Vagrantfile:
# config.vm.provision "shell", privileged: false, path: "https://raw.githubusercontent.com/janek-warchol/dotfiles/master/.install-utilities.sh"

# TODO: make this OS-agnostic?

set -o errexit

# Install latest version of git (packages found in distros' repositories
# are usually very old, and it really makes a difference in case of git)
sudo add-apt-repository --yes ppa:git-core/ppa
sudo apt-get --yes update
sudo apt-get --yes install git

# install trash-cli, a command line interface to system trash
sudo apt-get --yes install trash-cli

# Install the dotfiles if they're not yet present
if [ ! -f "$HOME/.config/dotfiles-git-dir" ]; then
    PARENT_DIR=$(dirname $(readlink --canonicalize "$0"))
    if [ -f "$PARENT_DIR"/.install-dotfiles.sh ]; then
        # apparently dotfiles repo is already cloned
        "$PARENT_DIR"/.install-dotfiles.sh
    else
        git clone https://github.com/janek-warchol/dotfiles ~/.dotfiles.git
        ~/.dotfiles.git/.install-dotfiles.sh
    fi
fi
