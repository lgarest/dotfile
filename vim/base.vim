" These configurations are enabled by default in NVim
" So we only set up for VIM
if !has('nvim')
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
    " always display the status line
    set laststatus=2
    " a better menu in command mode
    set wildmenu
    " proper backspace behavior
    set backspace=indent,eol,start
    " always set autoindenting on
    set autoindent
endif

" ignore case by default
set ignorecase
" display line numbers
set number relativenumber
" highlight the current cursor line
set cursorline
highlight CursorLine ctermbg=236

" number of spaces per tab
set softtabstop=4
" # of columns of text are indented
set shiftwidth=4
" insert spaces on tab
set expandtab

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
  " add rulers on lines 80 and 100
  set colorcolumn=80,100
endif

" IDE like features
" make :find work more like fuzzyfinder
set path+=**
" look for a tags file in the current directory
set tags=./tags,tags

