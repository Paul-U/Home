set fileencoding=japan
set fileencodings=utf-8,euc-jp,iso-20220jp,cp932
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


NeoBundle 'tyru/skk.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'kien/ctrlp.vim'

filetype plugin indent on

NeoBundleCheck

"-----------
"  skk.vim
"-----------
let skk_jisyo = '~/.skk-jisyo'
let skk_large_jisyo = '~/.skk.d/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1


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


"--------
"  misc
"--------
set laststatus=2
inoremap <C-c> <Esc>
cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'
