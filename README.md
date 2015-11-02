Sensible dotfiles
=================

![Screenshot of sensible-dotfiles](https://i.imgur.com/a4auwdx.png)

This is a selection of most common tweaks that make working with terminal
more enjoyable and productive.  Some command line defaults are over a decade
old - leave them behind and make your life easier!

* If you haven't done much customization before, this will be a good starting
  point.  (It's also a good opportunity to start versioning your dotfiles.)

* If you are pair programming or otherwise sharing a machine, you can install
  this rather than confuse other people with your personal configuration.

* You can install this on all your VMs etc. to have some basic amenities without
  making too many changes.

I will keep this repository small and focused, including only settings that
are _essential_ for comfortable work environment.  If you think that something
doesn't make a reasonable default and should be removed (or that I missed
an important setting), please [open an issue]
(https://github.com/janek-warchol/.sensible-dotfiles/issues).



Installation
------------

Clone the repo and run the [installation script](link-dotfiles.sh)
(it will backup your existing config files):

    git clone https://github.com/janek-warchol/.sensible-dotfiles
    cd .sensible-dotfiles/
    ./link-dotfiles.sh

You'll probably want to move some parts of your old configuration into
the new files.  Keep in mind that you need to re-run the installation script
if you add new files to the repo, to create missing symlinks.



Features
--------

Here's a summary of the most interesting settings:

- **git-aware [prompt](.bashrc#L97)** displaying repository status (see
  [screenshot](https://i.imgur.com/a4auwdx.png)) - _very convenient!_

- essential [git configuration](.gitconfig):
  - aliases for displaying **awesome [logs](.gitconfig#L32)**
    (see [screenshot](https://i.imgur.com/a4auwdx.png)),
  - a dozen of common shorthands, including `ci`, `co`, `br` and `st`,
  - improved output layout and coloring for `status`, `grep`, `blame` and `log`,
  - better default behaviour in case of merge conflicts, file renames etc.

- reasonable defaults and convenient aliases for [`ls`, `less` and `grep`]
  (.bashrc#L8):
  - let `ls` group directories together, listing them above files,
  - better searching and navigation inside `less`,
  - did you know that `grep` can highlight matches even when piped to `less`?

- handy bash [settings](.bashrc#L60), for example:
  - case-insensitive autocompletion,
  - more powerful shell [history](.bashrc#L75) and [navigation](.inputrc#L12),
  - `cd` to a directory just by typing its name, autocorrect typos

- disable [SSH timeouts](.ssh/config) - don't let the connection hang because
  of inactivity

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

If you're interested in my personal configuration (forked from this repo), look
[here](https://github.com/janek-warchol/my-dotfiles/tree/janek).

