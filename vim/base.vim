set nocompatible
" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings
filetype plugin indent on

set hlsearch        " display highlight on search
set incsearch       " display incremental highlight on search
set number relativenumber " always display hybrid line numbers

syntax on           " enables syntax highlight
set laststatus=2    " always display the status line
set wildmenu

" Tab config - 2 spaces on tab
set softtabstop=2   " number of spaces per tab
set shiftwidth=2    " # of columns of text are indented
set expandtab       " insert spaces on tab
set backspace=indent,eol,start " proper backspace behavior

" Splits
set splitbelow
set splitright

" Mouse
set mouse=a         " allow mouse on all modes

" Ruler
if exists('+colorcolumn')
  set colorcolumn=80,100 " add rulerson lines 80 and 100
endif

let python_highlight_all = 1

"" IDE like features
set path+=**            " make :find work more like fuzzyfinder
set tags=./tags,tags    " look for a tags file in the current directory
