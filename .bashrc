#!/bin/bash

export PS1="\u@\H $ "
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
case "${OSTYPE}" in
darwin*)
  alias ls="ls -Glh"
  alias la="ls -Glha"
  alias l.="ls -Gdlh .*"
  alias l="\ls"
  ;;
linux*)
  alias ls="ls -lh --color=auto --group-directories-first"
  alias la="ls -lha-char --color=auto"
  alias l.="ls -dlh .* --show-control-char --color=auto"
  alias l="\ls"
  ;;
esac
alias open="xdg-open"
alias e="~/bin/emacs-nw"

export GOPATH=$HOME/.local/go
export PATH=$PATH:$GOPATH/bin

export USERID=`id -u`
export EDITOR="vim"

if [ -e $HOME/.rvm ]; then
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source "$HOME/.rvm/scripts/rvm"
rvm use 2.0.0 > /dev/null
fi
