#!/bin/bash
if [[ $1 = update ]]; then
    cd ~/.vim
    git pull
    cd -
    vim +BundleClean +BundleUpdate +qall
else
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ln -s ~/.vim/vimrc ~/.vimrc
    vim +BundleInstall +qall
fi
