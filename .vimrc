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

if has('vim_starting')
    set nocompatible

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'tyru/eskk.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'

filetype plugin indent on

NeoBundleCheck

"------------
"  eskk.vim
"------------
let g:eskk#directory = "~/.eskk"
let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'euc-jp'}
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
	\     'eskk': 'MyEskkStatus'
	\ },
	\}
function! MyEskkStatus()
	return eskk#statusline()
endfunction
set laststatus=2

"--------
"  misc
"--------
inoremap <C-c> <Esc>
cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'
