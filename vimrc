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
    Plug 'flrnd/candid.vim' " For dark environments
    Plug 'ayu-theme/ayu-vim' " For light environments
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
    Plug 'vim-scripts/Tabmerge'

    " IDE like
    Plug 'Valloric/YouCompleteMe'
    Plug 'janko/vim-test'
    Plug 'ervandew/supertab'

    " Deactivated because it was causing syntax highlighting issues
    " Plug 'xolox/vim-easytags'
call plug#end()

" Enable 24-bit RGB color in the |TUI| if they are supported
if (has("termguicolors"))
    set termguicolors
    set t_Co=256
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


" Main theme configuration
" Dark theme
" set background=dark
" colorscheme candid

" Light theme
let ayucolor="light"
colorscheme ayu


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

let g:vim_jsx_pretty_colorful_config = 1 " default 0
