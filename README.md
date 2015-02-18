Here are my configuration files ("dotfiles"), or rather a specially selected
subset of them that I consider useful for everyone.



Installation
------------

Clone the repo and run the [installation script]
(https://github.com/janek-warchol/dotfiles/blob/master/.install-dotfiles.sh):

    git clone https://github.com/janek-warchol/dotfiles.git ~/.dotfiles
    ~/.dotfiles/.install-dotfiles.sh

It will make a backup of your existing config files before installing new ones
(unless you add `--overwrite` argument).



"Architecture" overview
-----------------------

[Some](https://github.com/ryanb/dotfiles)
[people](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
keep their dotfiles in a special folder and use a script to setup
appropriate symlinks in their `$HOME` directory.
[Others](https://github.com/rtomayko/dotfiles)
turn their whole `$HOME` dir into a git repository.

I use a hybrid approach that takes the best of both worlds: `$HOME` _is_
my working directory, but the actual repository data is placed somewhere
else, and all git operations can be accessed only with a special command.

This has the following advantages:
- the setup is simpler and there are fewer special cases to handle,
- there is no risk that some other program will break the symlinks,
- dotfiles' `.gitignore` doesn't interfere with other repositories,
- if you accidentally run a git command you won't mess everything up.

Credit for the idea goes to [Kyle Fuller]
(http://kylefuller.co.uk/posts/organising-dotfiles-in-a-git-repository/).


License
-------

Most of this stuff was written by me, but some parts were derived or copied
from others' work.  I grant everyone permission to use, modify, distribute
etc. the parts written by me, and I'll try to include proper attribution for
the parts authored by others.
