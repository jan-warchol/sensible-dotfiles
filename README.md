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

Clone the repo and run the [installation script](link-dotfiles.sh)
(it won't overwrite your existing files):

    git clone https://github.com/janek-warchol/sensible-dotfiles ~/.dotfiles.git
    ~/.dotfiles.git/link-dotfiles.sh

You'll probably want to move some parts of your old configuration into
the new files.  Keep in mind that you need to re-run the installation script
if you add new files to the repo, to create missing symlinks.

There are two additional programs worth installing:
- [`ranger`](http://nongnu.org/ranger/): a console file manager.
  Believe me, it's **much** better than typing `cd` and `ls` all the time.
- [`trash-cli`](https://github.com/andreafrancia/trash-cli): command-line interface
  to system trash.  Have you ever rm'ed wrong file and wanted to get it back?

Both are available from apt repositories: `sudo apt-get install ranger trash-cli`.



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



License
-------

I release this work into public domain.  Attribution will be very welcome,
but it's not strictly required.  Enjoy!
