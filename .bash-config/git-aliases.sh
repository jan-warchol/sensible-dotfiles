#!/bin/bash

# Bash aliases for git use - complementary with ones defined in .gitconfig.
# These are the most common variations of git diff and git log (commands
# that usually produce lots of output -> we don't want to have it written
# out in the console) piped to less, with coloring enabled.

  alias gd,='git diff --color=always | less -R -S'
 alias gdw,='git diff --color=always --word-diff=color | less -R -S'
 alias gdm,='git diff --color=always master | less -R -S'

  alias gl,='git log --color=always --decorate | less -R -S'
 alias glo,='git log --color=always --decorate --oneline --graph | less -R -S'
 alias glp,='git log --color=always --decorate --patch | less -R -S'
alias glpw,='git log --color=always --decorate --patch --word-diff=color | less -R -S'
