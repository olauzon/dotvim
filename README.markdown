My dotvim files
===============

Installation
------------

### Warning

This installation will clone this `dotvim` repository to your home folder and
delete your existing .vim directory and .vimrc file, so please back them up
before installing.

    mkdir -p ~/src
    cd ~/src
    git clone git://github.com/olauzon/dotvim.git
    cd dotvim
    ./bin/vim-install

Updating bundles
----------------

    cd ~/src/dotvim
    ./bin/vim-update
