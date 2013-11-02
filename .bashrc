export PS1="\w $ "
alias ls="ls -lh"
alias la="ls -lha"
alias emacs="emacs -nw"
emacs --daemon

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function emacs(){
ps | grep emacs | grep -v grep > /dev/null
if [ $? -eq 0 ] ; then
echo "emacs is already up."
jobs | grep emacs
return 1
else
command emacs $*
fi
}
