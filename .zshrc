source ~/.bashrc
source ~/.zsh.d/completion.zsh

PS1="[@${HOST%%.*} %0~]%(!.#.%%) "

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks

[ -e "${HOME}/.ssh/agent-env" ] && source "${HOME}/.ssh/agent-env"

if [ ${SHLVL} = 1 ]; then
    screen -x || screen
fi
