" These configurations are enabled by default in NVim
" So we only set up for VIM
if !has('nvim')
    set nocompatible
    " set hidden
    set ttyfast
    set smartcase
    " enables syntax highlight
    syntax on
    " The file will be parsed from the start
    syntax sync fromstart

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
    " Completion mode that is used for the character specified with 'wildchar'
    set wildmode=list:longest,full
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


" Set indentations, spaces, and tab behavior
function! SetIndentation(size)
    " Number of spaces to use for each step of (auto)indent.
    execute "set shiftwidth=".a:size
    " Number of spaces that a <Tab> counts for while performing editing
    " operations, like inserting a <Tab> or using <BS>.
    execute "set softtabstop=".a:size
    " Number of spaces that a <Tab> in the file counts for.
    execute "set tabstop=".a:size
endfunction
call SetIndentation(4)

" Indentation for specific file formats.
autocmd FileType yaml,json,javascrip,markdown :call SetIndentation(2)

" Markdown improved support
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufWritePost *.md :silent !markdown -o <afile>:p:h/<afile>:t:r.html <afile>:p

" Insert mode: Use the appropriate number of spaces to insert a <Tab>.
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

