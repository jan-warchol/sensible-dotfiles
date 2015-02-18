Here are my configuration files ("dotfiles"), or rather a specially selected
subset of them that I consider useful for everyone.

[Some](https://github.com/ryanb/dotfiles)
[people](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
keep their dotfiles in a special folder and symlink them to their `$HOME`.
[Others](https://github.com/rtomayko/dotfiles)
turn their whole `$HOME` directory into a git repository.
I use a hybrid approach that takes the best of both worlds: `$HOME` _is_
my working directory, but the actual repository data is placed somewhere
else, and git operations can be accessed only with a special `dotfiles`
command.



Installation
------------

Clone the repo and run the [installation script]
(https://github.com/janek-warchol/dotfiles/blob/master/.install-dotfiles.sh).
It will make a backup of your existing config files before installing new ones
(unless you run it with `--overwrite` option).

    git clone https://github.com/janek-warchol/dotfiles.git ~/.dotfiles
    ~/.dotfiles/.install-dotfiles.sh

Open a new terminal to see the effects.

You will probably want to move some parts of your old configuration into
the new files.



Usage
-----

You can now use `dotfiles` command to manage you repo, just as if you were using `git`:

    $ dotfiles status

    # On branch master
    # Your branch is up-to-date with 'origin/master'.
    # (...)



Features
--------

- some useful [aliases](.bash-config/aliases.sh) - did you know that `grep`
  can be made to highlight matches even when piped to `less`?
- [shortcuts](.bash-config/autocompleted-shortcuts.sh) for most common commands
  that work with autocompletion
- git- and ssh-aware [prompt](.bash-config/prompt.sh) (_very_ convenient)
- case-insensitive autocompletion and other nice [settings](.bash-config/settings.sh)

Additionally, the "work-tree-separate-from-git-dir" design has the following advantages:
- the setup is simpler and there are fewer special cases to handle,
- there is no risk that some other program will break the symlinks,
- dotfiles' `.gitignore` doesn't interfere with other repositories,
- if you accidentally run a git command you won't mess everything up.

Credit for this idea goes to [Kyle Fuller]
(http://kylefuller.co.uk/posts/organising-dotfiles-in-a-git-repository/).



License
-------

Most of this stuff was written by me, but some parts were derived or copied
from others' work.  I grant everyone permission to use, modify, distribute
etc. the parts written by me, and I'll try to include proper attribution for
the parts authored by others.
