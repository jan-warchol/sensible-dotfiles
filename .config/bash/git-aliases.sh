#!/bin/bash

# Bash aliases for git use - complementary with ones defined in .gitconfig.
# As `git diff` and `git log` produce lots of output, I don't want it to be
# printed directly in terminal, so I pipe them to less (with coloring enabled).

  alias gd='git diff --color=always | less -R -S'
# word-diff is especially useful for files with very long lines of text
# (e.g. a paragraph per line) - in that case we want less to wrap lines
 alias gwd='git diff --color=always --word-diff=color | less -R'

 alias glo='git log --color=always --decorate --oneline --graph | less -R -S'

# HEAD has to be listed explicitly so that it will be displayed even when it's detached
# I don't use --all because I don't want stashes to be shown, they are annoying
 alias gtk='gitk --branches --tags --remotes HEAD &'
