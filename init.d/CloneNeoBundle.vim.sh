#!/bin/bash

if [[ ! -d ~/.vim/bundle/neobundle.vim ]]; then
	mkdir ~/.vim/bundle -p
	cd ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim
fi
