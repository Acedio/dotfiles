#!/bin/bash

git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
vim +PluginInstall +qall

setxkbmap -option "ctrl:nocaps"
