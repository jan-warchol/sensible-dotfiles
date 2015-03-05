#!/bin/bash

# Install dotfiles together with some additional software -
# useful for provisioning a completely new computer (or a VM).
#
# To use with Vagrant, add this to your Vagrantfile:
# config.vm.provision "shell", privileged: false, path: "https://raw.githubusercontent.com/janek-warchol/dotfiles/master/.install-utilities.sh"

# TODO: make this OS-agnostic?

set -o xtrace
set -o nounset
set -o errexit

# Install latest version of git (packages found in distros' repositories
# are usually very old, and it really makes a difference in case of git)
sudo add-apt-repository --yes ppa:git-core/ppa
sudo apt-get --yes update
sudo apt-get --yes install git

sudo apt-get --yes install tree

# install trash-cli, a command line interface to system trash
git clone https://github.com/andreafrancia/trash-cli
cd trash-cli
sudo python setup.py install
cd ..
trash-put trash-cli

# Install the dotfiles if they're not yet present
if [ ! -f "$HOME/.config/dotfiles-git-dir" ]; then
    git clone https://github.com/janek-warchol/dotfiles ~/.dotfiles.git
    ~/.dotfiles.git/.install-dotfiles.sh
fi
