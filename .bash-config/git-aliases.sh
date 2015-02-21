#!/bin/bash

# Bash aliases for git use - complementary with ones defined in .gitconfig.
# As `git diff` and `git log` produce lots of output, I don't want it to be
# printed directly in terminal (because I want to see my previous commands),
# so I pipe them to less (with coloring enabled).

  alias gd,='git diff --color=always | less -R -S'
 alias gdc,='git diff --color=always --cached | less -R -S'
 alias gdm,='git diff --color=always master | less -R -S'
# word-diff is especially useful for files with very long lines of text
# (e.g. a paragraph per line) - in that case we want less to wrap lines
 alias gwd,='git diff --color=always --word-diff=color | less -R'
alias gwdc,='git diff --color=always --word-diff=color --cached | less -R'

  alias gl,='git log --color=always --decorate | less -R -S'
 alias glo,='git log --color=always --decorate --oneline --graph | less -R -S'
 alias glp,='git log --color=always --decorate --patch | less -R -S'
alias glpw,='git log --color=always --decorate --patch --word-diff=color | less -R -S'
