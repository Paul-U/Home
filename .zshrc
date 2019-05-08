source ~/.bash_profile
source ~/.zsh.d/completion.zsh
source ~/.zsh.d/prompt.zsh

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_verify
setopt hist_reduce_blanks

bindkey -e


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

