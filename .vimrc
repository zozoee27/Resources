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
Plugin 'jiangmiao/auto-pairs'

Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'flazz/vim-colorschemes'
	
call vundle#end()
filetype plugin indent on

"------------ GENERAL -------------

syntax on

"COPY AND PASTE
set clipboard+=unnamed

set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab

set nu

set incsearch
set hlsearch

inoremap jk <esc>

set backspace=indent,eol,start

let mapleader =" "
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

"----------- Regex -----------------
nnoremap / /\c
vnoremap / /\c


"---------- Ctrl P -----------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir=$HOME . '/.cache/ctrlp'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

"------------- EASY MOTION ---------
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
let g:fzf_buffers_jump = 1
map <C-p> :Files<CR>


"---------- Buffers -----------
nnoremap <C-b> :Buffers <CR>

"--------- Colors --------
colorscheme Tomorrow-Night-Eighties






