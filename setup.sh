#!/bin/bash

ln -s dotfiles/.vimrc dotfiles/.gvimrc dotfiles/.hgrc dotfiles/.Xdefaults dotfiles/.screenrc dotfiles/.tmux.conf ~

git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
vim +PluginInstall +qall

setxkbmap -option "ctrl:nocaps"
