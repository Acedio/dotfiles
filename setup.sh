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
  dotfiles/.guile \
  dotfiles/.stalonetrayrc \
  dotfiles/.xmobarrc \
  dotfiles/.jjconfig.toml \
  ~

ln -s ~/dotfiles/kitty ~/.config/

ln -s ~/dotfiles/bin/vimdirdiff ~/bin/

git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

setxkbmap -option "ctrl:nocaps"
