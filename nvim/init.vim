" ----------- General settings 
set nocompatible
set nu
set wrap!
set ignorecase
set backspace=indent,eol,start

set incsearch
set hlsearch

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

set list
"set lcs+=space:·
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.cache 

"----------- Key Mappings
let mapleader = " "

"--- Normal Shorcuts
inoremap jk <esc>
nnoremap / /\c
vnoremap / /\c
nnoremap ? ?\c
vnoremap ? ?\c

" Navigate quickfix list with ease
nnoremap <silent>[ :cprevious<CR>
nnoremap <silent>] :cnext<CR>

"--- Buffer -------
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

" -------------- VIM Plug ------
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ------ Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-solargraph'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'github/copilot.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'alvan/vim-closetag'

Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'qpkorr/vim-bufkill'

" -- Themes
Plug 'sainnhe/everforest'
Plug 'blueyed/vim-diminactive'
Plug 'kien/rainbow_parentheses.vim'

" -- Ruby
Plug 'vim-ruby/vim-ruby'

" -- Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" ---- other util
Plug 'tpope/vim-fugitive'
Plug 'preservim/vimux'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'ruanyl/vim-gh-line'

call plug#end()

" ------- Themes ----------
let g:everforest_background = 'hard'
colorscheme everforest
set background=light

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Highlight

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
match ExtraWhitespace /^\t*\zs \+/

" ------------------ Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"--------- Buffers -----------
nnoremap <C-b> :Buffers <CR>
nnoremap <Leader>db :BD <CR>
nnoremap <C-j> <C-o>
nnoremap <C-k> <C-i>

"------------- EASY MOTION ---------
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>/ <Plug>(easymotion-jumptoanywhere)

"- NERDTree ------------------------------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>r. :NERDTreeRefreshRoot<CR>
"
"- NERDCommenter---------------------------------------------------------
let NERDSpaceDelims=1
map <leader>ccsdfklj <Plug>NERDCommenterComment
map <leader>cc <Plug>NERDCommenterToggle

" - FZF ----------------------------------------------------------------
nmap <c-p> :FZF<CR>
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val  }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'}

nnoremap <silent> <Leader>f :Rg <C-R><C-W><CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <S-f> :BLines<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0  }  }
let g:fzf_layout = { 'down': '30%'  }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ---------- COC
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-solargraph', 'coc-yaml', 'coc-graphql', 'coc-tsserver']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
nmap <silent>rn <Plug>(coc-rename)

inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ------------ VIMUX ------
nmap <silent> <leader>t :VimuxRunCommand 'dev test '.@%<CR>
nmap <silent> <leader>a :VimuxRunCommand 'dev test .'<CR>

" Open current directory -------- -------t .
nmap <silent> <leader>. :VimuxRunCommand 'cd '.expand('%:h')<CR> 

" ----------------- Github
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>dif :Gdiff<CR>

" -------- copilot
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <S-Tab> copilot#Accept("\<CR>")

" ------------- Bookmarks ----------
nmap <Leader>m <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>bm <Plug>BookmarkShowAll
nmap <Leader>bd <Plug>BookmarkClear
nmap <Leader>bx <Plug>BookmarkClearAll

let g:bookmark_sign = '♥'

" ---------- CloseTag ------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
