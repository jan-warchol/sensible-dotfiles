# I usually want to see the output of my previous commands again after
# I'm done viewing `git diff` or `git log`, so I pipe them to less (with
# coloring enabled) - when I exit less, their output will be cleared.

gd() { git d "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
# word-diff is especially useful for files with very long lines of text
# (e.g. a paragraph per line) - in that case we want less to wrap lines
gwd() { git wd "$@" | less --RAW-CONTROL-CHARS; }

gls() { git ls "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gla() { git la "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }
gll() { git ll "$@" | less --RAW-CONTROL-CHARS --chop-long-lines; }

# HEAD has to be listed explicitly so that it will be displayed even when it's detached
# I don't use --all because I don't want stashes to be shown, they are annoying
gtk() { gitk --branches --remotes HEAD "$@" & }
