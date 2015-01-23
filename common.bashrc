# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# git prompt
PS1='\[\033[00;34m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;32m\]\w\[\033[00m\]$ '

# VI mode in BASH readline
set -o vi

# Prevent ^S from sending the XOFF signal
stty -ixon
