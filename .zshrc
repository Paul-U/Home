source ~/.bashrc

PS1="[@${HOST%%.*} %0~]%(!.#.%%) "
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks
