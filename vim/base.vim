set nocompatible
" set hidden
set ttyfast
set smartcase
" enables syntax highlight
syntax on

set nopaste
" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings
filetype plugin indent on

" display highlight on search
set hlsearch
" display incremental highlight on search
set incsearch
" ignore case by default
set ignorecase
" display line numbers
set number
" highlight the current cursor line
set cursorline
highlight CursorLine ctermbg=236

" always display the status line
set laststatus=2
" a better menu in command mode
set wildmenu

" Tab config - 2 spaces on tab782 27D2 5BD8 4FA1 44C9 EFE9 292F 2518 250A
" number of spaces per tab
set softtabstop=4
" # of columns of text are indented
set shiftwidth=4
" insert spaces on tab
set expandtab
" proper backspace behavior
set backspace=indent,eol,start
" always set autoindenting on
" set autoindent

" Splits
set splitbelow
set splitright

" Mouse
" allow mouse on all modes
set mouse=a
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Ruler
if exists('+colorcolumn')
  " add rulerson lines 80 and 100
  set colorcolumn=80,100
endif

" IDE like features
" make :find work more like fuzzyfinder
set path+=**
" look for a tags file in the current directory
set tags=./tags,tags

