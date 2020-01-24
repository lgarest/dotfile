" Load plugins via plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'flrnd/candid.vim'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'mileszs/ack.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'mattn/emmet-vim'
    Plug 'ervandew/supertab'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Yilin-Yang/vim-markbar'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/vim-emoji'
    Plug 'tpope/vim-surround'
    Plug 'janko/vim-test'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme OceanicNext
set background=dark
colorscheme candid

" Options, commands, and autocommands
source ~/dev/dotfile/vim/base.vim

" Netrw settings
source ~/dev/dotfile/vim/netrw.vim

" Snippets
source ~/dev/dotfile/vim/snippets.vim

" Maps
source ~/dev/dotfile/vim/maps.vim

" Plugins settings
source ~/dev/dotfile/vim/pluginsettings.vim

" nvim settings
if (has("nvim"))
    " python executable for nvim
    let g:python3_host_prog = '/Users/luis/venvs/py3nvim/bin/python'
endif

