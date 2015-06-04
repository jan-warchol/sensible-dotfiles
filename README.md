This repository aims to be a collection of most common and most useful settings
for command line tools - sort of "defaults that should be there in the first
place".  It should be a good starting point for people new to the command line,
but I expect that experienced users will also find interesting things here.

To avoid bloat, I'm setting the following restriction: all files combined must
have less than 900 lines in total (preferably less than 600), including comments
and this README itself.

If you're interested in my personal configuration (based on this one), check out
[`this repo`](https://github.com/janek-warchol/my-dotfiles/tree/janek).



Installation
------------

Clone the repo and run the [installation script](.install-dotfiles.sh).
It will make a backup of your existing config files before installing new ones
(unless you run it with `--overwrite` option).

    git clone https://github.com/janek-warchol/sensible-dotfiles ~/.dotfiles.git
    ~/.dotfiles.git/.install-dotfiles.sh

You'll probably want to move some parts of your old configuration into
the new files.  For convenience, all `.sh` files from `.config/bash/` directory
will be automatically sourced by `.bashrc`.

Note that to manage this repo you have to use `dotfiles` command instead of `git`
(see [_Structure_](README.md#structure)).



Features
--------

- **git-aware [bash prompt](.config/bash/prompt.sh)** displaying repository status, like this:  
  `janek@janek ~/.dotfiles.git (master|REBASE-i 3/5)` - _very_ convenient!

- lots of git [aliases, settings](.config/git/config) and
  [shorthands](.config/bash/git-aliases.sh) - in particular:
  - `git trash` command for discarding changes safely,
  - informative and **pretty [logs](.config/git/config#L50)**,
  - more information in case of merge conflicts,
  - `git diff` that displays file renames correctly

- handy [shell aliases](.config/bash/aliases.sh) - did you know that
  - `grep` can highlight matches even when piped to `less`?
  - `ls` can group directories together, listing them above files?

- [safeguards](.config/bash/safeguards.sh) that you can use to protect yourself from
  some common mistakes (have you ever `rm`'ed wrong file and wanted to get it back?)

- cool bash [settings](.config/bash/settings.sh), for example:
  - case-insensitive autocompletion,
  - `cd` to a directory just by typing its name, autocorrect typos

- [autocompletion](.config/bash/autocompletion.sh) for some of the shell aliases.



Structure
---------

[Some](https://github.com/ryanb/dotfiles)
[people](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
keep their dotfiles in a special folder and symlink them to their `$HOME`.
[Others](https://github.com/rtomayko/dotfiles)
turn their whole `$HOME` directory into a git repository.

I use a hybrid approach that takes the best of both worlds: `$HOME` _is_
my working directory, but the actual repository data is _not_ kept in `$HOME/.git` -
it can be in any directory you want (by default it's in the directory where
the repo was initially cloned).

Git will recognize that `$HOME` is a repository only if you call it like this:

    git --work-tree="$HOME" --git-dir="$HOME/.dotfiles.git"

(that's what the [`dotfiles`](.bashrc#L4) command does).

This design has the following advantages:
- there are no symlinks that could get broken by some other programs,
- dotfiles' `.gitignore` doesn't interfere with other repositories,
- if you accidentally run a git command in a wrong dir you won't mess everything up.

Credit for this idea goes to [Kyle Fuller]
(http://kylefuller.co.uk/posts/organising-dotfiles-in-a-git-repository/).

Note that git is configured to ignore everything except hidden files in this
repository - see [`.gitignore`](.gitignore) for details.



License
-------

I release this work into public domain.  Attribution will be very welcome,
but it's not strictly required.  Enjoy!
