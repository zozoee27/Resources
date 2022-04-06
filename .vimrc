"----------- vundle PLUGINS ------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ctrlp.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-ruby/vim-ruby'
Plugin 'easymotion/vim-easymotion'
Plugin 'fatih/vim-go'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'

Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plugin 'junegunn/fzf.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'flazz/vim-colorschemes'
	
call vundle#end()
"filetype plugin indent on

"------------ GENERAL -------------

syntax on

"COPY AND PASTE
set clipboard+=unnamed

set ignorecase
set smartcase
set smartindent
set autoindent

set tabstop=2
set shiftwidth=2
set expandtab

set nu

set incsearch
set hlsearch

inoremap jk <esc>

set backspace=indent,eol,start

"----------- Display white spaces -----------------
set lcs+=space:·
set list

let mapleader =" "
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

"----------- Regex -----------------
nnoremap / /\c
vnoremap / /\c
nnoremap ? ?\c
vnoremap ? ?\c

"---------- Ctrl P -----------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir=$HOME . '/.cache/ctrlp'
nnoremap <leader>r :ClearCtrlPCache<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

"------------- EASY MOTION ---------
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:fzf_buffers_jump = 1
"map <C-p> :Files<CR>

"---------- Buffers -----------
nnoremap <C-b> :Buffers <CR>
nnoremap <Leader>db :BD <CR>

"--------- Colors --------
colorscheme Tomorrow-Night-Eighties

"--------- NERDTree --------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>

"--------- YCM - Ruby --------
set omnifunc=javascriptcomplete#CompleteJS,htmlcomplete#CompleteTags
let g:ycm_language_server = [ 
\   { 'name': 'ruby', 
\     'cmdline': ['/opt/homebrew/lib/ruby/gems/2.7.0/bin/solargraph', '--stdio' ],
\     'filetypes': [ 'ruby' ] 
\   } 
\ ]

