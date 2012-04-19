# Shell and Vim dotfiles

This repository contains common, host-customizable shell and vim dotfiles for synchronization between many hosts.

## Setup

Clone the repository:

    $ cd ~/git
    $ git clone git@bitbucket.org:bjcerveny/dotfiles.git

### Shell

Create symbolic links in your HOME directory. First backup and remove any existing local dotfiles.

    $ ln -s git/dotfiles/zshrc .zshrc
    $ ln -s git/dotfiles/zshrc.local .zshrc.local

### Vim

    $ ln -s git/dotfiles/vimrc  .vimrc
    $ ln -s git/dotfiles/gvimrc .vimrc
    $ ln -s git/dotfiles/vim    .vim

## Customization

