#!/bin/bash
if [[ $1 = update ]]; then
    cd ~/.vim
    git pull
    cd -
    vim +BundleClean +BundleUpdate +qall
else
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ln -s ~/.vim/vimrc ~/.vimrc
    mkdir -p ~/.vim/_backup
    mkdir -p ~/.vim/_undo
    vim +BundleInstall +qall
fi
