#!/bin/bash

export PS1="\w $ "
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
alias ls="ls -lh --show-control-char --color=auto"
alias la="ls -lha --show-control-char --color=auto"
alias l.="ls -dlh .* --show-control-char --color=auto"

USERID=`id -u`

if [ -e $HOME/.rvm ]; then
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source "$HOME/.rvm/scripts/rvm"
rvm use 2.0.0 > /dev/null
fi
