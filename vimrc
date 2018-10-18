" Turn off compatible
set nocompatible

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
"set list listchars=eol:¬,tab:▷\
"nu

" Vim Plug
" Check if plug installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugs
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'davidhalter/jedi-vim'
Plug 'dylanaraps/wal.vim'
call plug#end()

" General settings
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase
set pastetoggle=<F2> " Removes auto indent when pasting with mouse
set nojoinspaces  " Use one space, not two, after punctuation.
set wildignore=*.swp,*.bak,*.pyc,*.class
set relativenumber

" Airline settings
set t_Co=256 " required
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" Jedi settings
" let g:jedi#use_splits_not_buffers='right'

" Encoding
set encoding=utf-8

" Color
" colorscheme wal

" Numbers
set number
set numberwidth=5

" KEYBINDINGS
" mapleader
let mapleader = ","

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Make jj do esc
inoremap jj <Esc>

" Make Y like C D
nnoremap Y y$

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" NerdTree
map <C-n> :NERDTreeToggle<CR>

au BufNewFile,BufRead *.py;
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent nosmartindent |
    \ set fileformat=unix |
    \ set colorcolumn=80 |
    \ set encoding=utf-8 |
"    \ highlight ColorColumn ctermbg=5 |
    \ syntax on

au BufNewFile,BufRead *.js, *.html, *.css;
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab

" au BufNewFile,BufRead *.py, *.pyw match BadWhitespace /\s+$/
