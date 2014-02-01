set fileencoding=japan
set fileencodings=utf-8,euc-jp,iso-20220jp,cp932
set number
syntax on

let skk_jisyo = '~/.skk-jisyo'
let skk_large_jisyo = '~/.skk.d/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1

set laststatus=2

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

filetype plugin indent on

NeoBundleCheck
