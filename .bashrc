#!/bin/bash

export PS1="\w $ "
alias ls="ls -lh"
alias la="ls -lha"

USERID=`id -u`

emacs(){
emacsclient -n -c  -e '(load "~/.emacs.d/init.d/10-font.el")' -a ''
}
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source "$HOME/.rvm/scripts/rvm"
rvm use 2.0.0
