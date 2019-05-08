#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\u@\H $ "
export TERM="xterm-256color"
export LESS="-i -M -R -S -x4"
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
  alias la="ls -lha --color=auto"
  alias l.="ls -dlh .* --show-control-char --color=auto"
  alias l="\ls"
  ;;
esac

alias dc="docker-compose"

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/lib/bin


export USERID=`id -u`
export EDITOR="vim"

function sqlite3-dump () {
    sqlite3 $* ".dump"
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"
