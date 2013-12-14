source ~/.bashrc
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PS1="[@${HOST%%.*} %1~]%(!.#.%%) "
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

