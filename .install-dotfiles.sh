#!/bin/bash

set -e
IFS=$(echo -en "\n\b")
normal="\e[00m"; bold="\e[1;37m"; green="\e[00;32m"

REPO_PATH="$(dirname $(readlink --canonicalize $0))"
echo "Installing dotfiles from $REPO_PATH repository..."

# make sure we're in correct repository
cd "$REPO_PATH";
root_commit=$(git rev-list --max-parents=0 HEAD)
if [[ $root_commit != 2d33ed8b8a804f7* ]]; then
    echo "This is not a clone of janek-warchol/dotfiles!"; exit
fi

# transform into a quasi-bare repository
git ls-files | xargs rm
git ls-files | xargs dirname | uniq | grep -v "^\.$" | xargs rmdir
mv "$REPO_PATH"/.git/* "$REPO_PATH"; rmdir "$REPO_PATH/.git"

echo -e "\nThis will install the following files:"
dotfiles() { git --work-tree="$HOME" --git-dir="$REPO_PATH" "$@"; }
cd; dotfiles ls-files
echo ""

# list conflicting files
for f in `dotfiles ls-files`; do
    if [[ -f "$f" && $(dotfiles diff "$f") ]]; then
        if [ "$1" == "--overwrite" ]; then
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
echo "$REPO_PATH" > "$HOME/.dotfiles-repo-path"
echo -e "\n${green}Done.${normal}"
