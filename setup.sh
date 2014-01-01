#!/bin/sh

target=(".bashrc" ".bash_profile" "bin" ".emacs.d" ".fonts" \
	".inputrc" ".screenrc" ".skk" "texmf" ".vim" "_vimrc" \
	".zshrc" ".zsh.d")

for file in ${target[@]}
do
	echo $file
	if [ -a ~/$file ]; then
		if [ -d ~/$file ]; then
			rm ~/$file -rf
		else
			rm ~/$file
		fi
	fi
	ln -s `pwd`/$file ~/
done
