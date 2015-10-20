Think of this repo as a set of defaults that command line tools should have
had in the first place - a selection of common tweaks and tricks for your
terminal.

* If you haven't done much command line customization before, this will be
  a good starting point.

* If you are managing a shared Linux server, you can install this rather
  than confuse other people with your personal dotfiles.

* It's also a good opportunity to start versioning your configuration :)

I will keep this repository small and focused.
If you're interested in my personal configuration (forked from this repo), look
[here](https://github.com/janek-warchol/my-dotfiles/tree/janek).



Installation
------------

Clone the repo and run the [installation script](link-dotfiles.sh)
(it will backup your existing config files):

    git clone https://github.com/janek-warchol/sensible-dotfiles ~/.dotfiles.git
    ~/.dotfiles.git/link-dotfiles.sh

You'll probably want to move some parts of your old configuration into
the new files.  Keep in mind that you need to re-run the installation script
if you add new files to the repo, to create any missing symlinks.



Features
--------

- **git-aware [bash prompt](.bashrc#L80)** displaying repository status, like this:  
  `janek@janek ~/.dotfiles.git (master|REBASE-i 3/5)` - _very convenient!_

- [git aliases and settings](.gitconfig), in particular:
  - informative and **pretty [logs](.gitconfig#L47)**,
  - more information in case of merge conflicts,
  - `git diff` that displays file renames correctly

- handy [shell aliases](.bashrc#L5) - did you know that
  - `grep` can highlight matches even when piped to `less`?
  - `ls` can group directories together, listing them above files?

- cool bash [settings](.bashrc#L43), for example:
  - case-insensitive autocompletion,
  - `cd` to a directory just by typing its name, autocorrect typos

- Tim Pope's [sensible.vim](https://github.com/tpope/vim-sensible) - reasonable
  and widely accepted default configuration for Vim

- turtles all the way down: a global [`Vagrantfile`](.vagrant.d/Vagrantfile)
  that lets [Vagrant](https://www.vagrantup.com/) install sensible-dotfiles
  on your VMs as well!



Other good stuff
----------------

Want more?  There are some additional programs worth installing:
- [`ranger`](http://nongnu.org/ranger/): a console file manager.
  It's **much better** than typing `cd` and `ls` all the time.
- [`trash-cli`](https://github.com/andreafrancia/trash-cli): command-line interface
  to system trash.  Have you ever `rm`'ed wrong file and wanted to get it back?

Both are available from apt repositories: `sudo apt-get install ranger trash-cli`.



License
-------

I release this work into public domain.  Attribution will be very welcome,
but it's not strictly required.  Enjoy!
