#!/bin/bash

REL=$(pwd |perl -p -e "s|$HOME/||g")
PWD=$(pwd)

git pull
git submodule init
git submodule update
ln -si $REL/profile $HOME/.bash_profile
ln -si $REL/vimrc $HOME/.vimrc
rm -ri $HOME/.vim
ln -si $REL/vim $HOME/.vim
ln -si $REL/gitconfig $HOME/.gitconfig
ln -si $REL/siegerc $HOME/.siegerc
ln -si $REL/csshrc $HOME/.csshrc
ln -si $REL/i2csshrc $HOME/.i2csshrc

ln -si ../$REL/ssh/config $HOME/.ssh/config
chmod 0600 $HOME/.ssh/config
