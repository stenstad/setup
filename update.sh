#!/bin/bash

REL="$HOME/setup"
PWD=$(pwd)



function updatelink {
sourcefile=$1
file=$2
if [ ! -e $sourcefile ];then
    echo sourcefile $sourcefile does not exist
    exit 0
fi
if [ -e $file ]; then
    if [ -L $file ]; then
        link=$(readlink -n $file)
        if [ "$link" != "$sourcefile" ]; then
            echo $file points to $link not $sourcefile fixing symlink
            rm -ri $file
            ln -s $sourcefile $file
        fi

    else
        echo $file is not a symlink. Deleting and linking
        rm -ri $file
        ln -s $sourcefile $file
    fi
else
    echo $file does not exist. Linking
    ln -s $sourcefile $file

fi
}

function makedir {
dir=$1
if [ ! -d $dir ];then
    mkdir -v $dir;
fi;
}


git pull
git submodule init
git submodule update
updatelink $REL/tmux.conf $HOME/.tmux.conf
updatelink $REL/bashrc $HOME/.bashrc
updatelink $REL/bash_profile $HOME/.bash_profile
updatelink $REL/vimrc $HOME/.vimrc
#rm -ri $HOME/.vim
makedir $HOME/.vim/
makedir $HOME/.vim/bundle
updatelink $REL/vim/bundle/neobundle.vim $HOME/.vim/bundle/neobundle.vim
updatelink $REL/vim/colors $HOME/.vim/colors
updatelink $REL/gitconfig $HOME/.gitconfig
updatelink $REL/siegerc $HOME/.siegerc
updatelink $REL/csshrc $HOME/.csshrc
updatelink $REL/i2csshrc $HOME/.i2csshrc
makedir $HOME/.config
updatelink $REL/liquidpromptrc $HOME/.config/liquidpromptrc
updatelink $REL/ssh/config $HOME/.ssh/config
chmod 0600 $HOME/.ssh/config
