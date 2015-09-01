Think of this repo as a set of defaults that common cli tools should have
had in the first place.  Many people have similar aliases and settings -
this is an attempt to create a "common ground" that will be useful for everyone.

* if you haven't done much command line customization before, this will be
  a good starting point

* if you are managing a shared Linux server, you can install this rather
  than confuse other people with your personal dotfiles

I'm going to keep this repository small and focused.  Right now it's barely
over 200 lines of code, and I never expect it to exceed 500.
If you're interested in my personal configuration (forked from this repo), look
[here](https://github.com/janek-warchol/my-dotfiles/tree/janek).



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
  `janek@janek ~/.dotfiles.git (master|REBASE-i 3/5)` - _very convenient!_

- lots of git [aliases and settings](.config/git/config), in particular:
  - informative and **pretty [logs](.config/git/config#L50)**,
  - more information in case of merge conflicts,
  - `git diff` that displays file renames correctly

- handy [shell aliases](.config/bash/aliases.sh) - did you know that
  - `grep` can highlight matches even when piped to `less`?
  - `ls` can group directories together, listing them above files?

- cool bash [settings](.config/bash/settings.sh), for example:
  - case-insensitive autocompletion,
  - `cd` to a directory just by typing its name, autocorrect typos



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
