"----------- vundle PLUGINS ------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ctrlp.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'YouCompleteMe'

Plugin 'easymotion/vim-easymotion'

Plugin 'fatih/vim-go'
	
call vundle#end()
filetype plugin indent on

"------------ GENERAL -------------

syntax on

"COPY AND PASTE
set clipboard+=unnamedplus

set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab

set nu

inoremap jk <esc>

"----------- Regex -----------------
nnoremap / /\c
vnoremap / /\c


"---------- Ctrl P -----------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir=$HOME . '/.cache/ctrlp'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 
