set encoding=utf-8
set fileencoding=japan
set fileencodings=utf-8,euc-jp,iso-20220jp,cp932
set fileformats=unix,dos,mac
setl fenc=utf-8
setl ff=unix
set number
set showcmd
set modeline
syntax on
set hidden
set foldlevel=99

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

"------------
" dein.vim
"------------

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if !isdirectory("~/.vim/bundles/repos/github.com/Shougo/dein.vim")
  call system("bash <(curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.vim/bundles")
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.vim/rc/dein.toml')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"------------
"  eskk.vim
"------------
let g:eskk#directory = "~/.skk.d/eskk"
let g:eskk#dictionary = { 'path': "~/.skk.d/eskk/eskk-jisyo", 'sorted': 0, 'encoding': 'utf-8'}
let g:eskk#large_dictionary = { 'path': "~/.skk.d/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp'}

"-------------
"  lightline
"-------------
let g:lightline = {
	\ 'active': {
	\ 	'left': [ ['mode', 'eskk', 'paste'],
	\                 ['readonly', 'filename', 'modified'] ]
	\ },
	\ 'component_function': {
	\     'eskk': 'eskk#statusline'
	\ },
	\}
set laststatus=2

"--------
"  misc
"--------
inoremap <C-c> <Esc>
cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
let g:vim_markdown_folding_disabled=1

syntax on

noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
noremap ss      :split<CR>
noremap sh      <C-w>h
noremap sl      <C-w>l
noremap sk      <C-w>k
noremap sj      <C-w>j
noremap sw      <C-w>w

