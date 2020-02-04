" Load plugins via plug

" install plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'xolox/vim-misc'

    " theme plugins
    Plug 'flrnd/candid.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " language support
    Plug 'sheerun/vim-polyglot'
    Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'mattn/emmet-vim'

    " git utils
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " utils
    Plug 'mileszs/ack.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'Yilin-Yang/vim-markbar'
    Plug 'tpope/vim-surround'

    " IDE like
    Plug 'Valloric/YouCompleteMe'
    Plug 'janko/vim-test'
    Plug 'ervandew/supertab'

    " Deactivated
    " Plug 'xolox/vim-easytags'
call plug#end()

" Enable 24-bit RGB color in the |TUI| if they are supported
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
" colorscheme OceanicNext
colorscheme candid

" Options, commands, and autocommands
source ~/dev/dotfile/vim/base.vim

" Netrw settings & mappings
source ~/dev/dotfile/vim/netrw.vim

" Snippets
source ~/dev/dotfile/vim/snippets.vim

" Maps
source ~/dev/dotfile/vim/maps.vim

" Plugins settings
source ~/dev/dotfile/vim/pluginsettings.vim

" nvim settings
if (has("nvim"))
    source ~/dev/dotfile/vim/nvim.vim
endif

