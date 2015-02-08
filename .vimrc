set encoding=utf-8
set fileencoding=japan
set fileencodings=utf-8,euc-jp,iso-20220jp,cp932
set fileformats=unix,dos,mac
setl fenc=utf-8
setl ff=unix
set number
syntax on

"-----------------
"  NeoBundle.vim
"-----------------

if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"------------
"  eskk.vim
"------------
let g:eskk#directory = "~/.skk.d/eskk"
let g:eskk#dictionary = { 'path': "~/.skk.d/eskk/eskk-jisyo", 'sorted': 0, 'encoding': 'utf-8'}
let g:eskk#large_dictionary = { 'path': "~/.skk.d/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp'}

"----------
"  golang
"----------
filetype off
filetype plugin indent off
set runtimepath+=/usr/share/go/misc/vim
au FileType go setlocal sw=4 ts=4 sts=4 noet
au FileType go setlocal makeprg=go\ build\ ./... errorformat=%f:%l\ %m
au BufWritePre *.go Fmt
filetype plugin indent on


"-------------
"  yankround
"-------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

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
