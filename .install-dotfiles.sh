#!/bin/bash

set -e
IFS=$(echo -en "\n\b")
normal="\e[00m"; bold="\e[1;37m"; green="\e[00;32m"

# extract repository path; make sure we're in the correct one
REPO_PATH="$(dirname $(readlink --canonicalize $0))"
if [[ "$REPO_PATH" = "$HOME" ]]; then echo "Cannot install in HOME."; exit; fi
cd "$REPO_PATH";
root_commit=$(git rev-list --max-parents=0 HEAD)
if [[ $root_commit != 2d33ed8b8a804f7* ]]; then
    echo "The script was placed in wrong repository - WTF?"; exit
fi

echo "Transforming $REPO_PATH repository into a quasi-bare one..."
git ls-files | xargs rm
git ls-files | xargs dirname | uniq | grep -v "^\.$" | xargs rmdir
mv "$REPO_PATH"/.git/* "$REPO_PATH"; rmdir "$REPO_PATH/.git"

echo "$REPO_PATH" > "$HOME/.dotfiles-repo-path"
dotfiles() { git --work-tree="$HOME" --git-dir="$REPO_PATH" "$@"; }
echo -e "\nThis will install the following files:"
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
echo -e "\n${green}Done.${normal} Open a new terminal to see the effects."
