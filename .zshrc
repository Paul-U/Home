source ~/.bash_profile
source ~/.zsh.d/completion.zsh

source ~/.zsh.d/prompt.zsh

zshgo="/usr/share/go/misc/zsh/go"
[ -f $zshgo ] && source $zshgo

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks

[ -e "${HOME}/.ssh/agent-env" ] && source "${HOME}/.ssh/agent-env"

function tmuxx(){
	if tmux has; then
		tmux attach-session
	else
		tmux
	fi
}

