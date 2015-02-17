#!/bin/bash

set -e
IFS=$(echo -en "\n\b")
normal="\e[00m"; bold="\e[1;37m"; green="\e[00;32m"

# parse installation path from first argument
if [ -z $1 ]; then echo "Usage: bash .install-dotfiles.sh <path>"; exit 1; fi
REPO_PATH="$(readlink --canonicalize-missing $1)"
echo $REPO_PATH > "$HOME/.dotfiles-repo-path"
dotfiles() { git --work-tree="$HOME" --git-dir="$REPO_PATH" "$@"; }
cd

# we want something between a normal and a bare repo
git clone --no-checkout https://github.com/janek-warchol/dotfiles "$REPO_PATH"
mv "$REPO_PATH"/.git/* "$REPO_PATH"; rmdir "$REPO_PATH/.git"
# don't interpret existing state as staged changes
dotfiles reset --mixed --quiet
echo -e "\nThis will install the following files:"
dotfiles ls-files
echo ""

# list conflicting files
for f in `dotfiles ls-files`; do
  if [[ -f "$f" && $(dotfiles diff "$f") ]]; then
    if [ "$2" == "--overwrite" ]; then
      echo -e "Warning: your ${bold}${f}${normal} will be overwritten!"
    else
      echo -e "Renaming your existing ${bold}${f}${normal} to $f.old"
      mv "./$f" "./$f.old"
    fi
    sleep 0.03
  fi
done
sleep 3

# actual installation
dotfiles reset --hard --quiet
echo -e "\n${green}Done.${normal} Open a new terminal to see the effects."
