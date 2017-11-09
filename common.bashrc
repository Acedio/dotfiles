# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=20000

# git prompt
if [ -e /usr/share/git/completion/git-prompt.sh ]
then
source /usr/share/git/completion/git-prompt.sh
fi
export PS1='\[\033[00;34m\]\h\[\033[00;37m\]:\[\033[31m\]$(__git_ps1 "(%s)\[\033[01m\]")\[\033[00;32m\]\w\[\033[00m\]$ '

# Prevent ^S from sending the XOFF signal
stty -ixon

export EDITOR=vim
export VISUAL=vim

# Load up fzf stuff.
export FZF_DEFAULT_OPTS='-x'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf -x --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && history -s ${EDITOR:-vim} "$file" && ${EDITOR:-vim} "$file"
}
