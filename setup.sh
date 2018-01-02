#!/bin/bash

ln -s \
  dotfiles/.Xdefaults \
  dotfiles/.gitconfig \
  dotfiles/.gvimrc \
  dotfiles/.hgrc \
  dotfiles/.screenrc \
  dotfiles/.tmux.conf \
  dotfiles/.vimrc \
  dotfiles/.inputrc \
  ~

git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

setxkbmap -option "ctrl:nocaps"
