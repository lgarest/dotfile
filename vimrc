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
    Plug 'joshdick/onedark.vim' " Atom One Dark theme
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " language support
    Plug 'sheerun/vim-polyglot'

    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    " Plug 'posva/vim-vue'

    " JSX support
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'heavenshell/vim-jsdoc', { 
      \ 'for': ['javascript', 'javascript.jsx','typescript'], 
      \ 'do': 'make install'
    \}

    " Styled components support
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

    " Emmet support
    Plug 'mattn/emmet-vim'

    " git utils
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/gv.vim'

    " utils
    Plug 'kien/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'vim-scripts/Tabmerge'
    Plug 'ryanoasis/vim-devicons'
    Plug 'wsdjeg/vim-fetch'

    " IDE like
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'plasticboy/vim-markdown' " Doesn't work with coc?
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-obsession'
    Plug 'crispydrone/vim-tasks'
    Plug 'yaegassy/coc-jsdoc', {'do': 'yarn install --frozen-lockfile'}

    " Diffing like a boss
    Plug 'will133/vim-dirdiff' " Run a diff on 2 directories

    " Better dealing with buffers
    Plug 'Asheq/close-buffers.vim'

    " Distraction free writing
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" let g:vim_jsx_pretty_highlight_close_tag=1

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
let ayucolor="dark"
colorscheme ayu

let g:coc_node_path = trim(system('which node'))
let g:coc_npm_path = trim(system('which npm'))

" Options, commands, and autocommands
source ~/dev/dotfile/vim/base.vim

" Netrw settings & mappings
source ~/dev/dotfile/vim/netrw.vim

" Maps
source ~/dev/dotfile/vim/maps.vim

" Plugins settings
source ~/dev/dotfile/vim/pluginsettings.vim

" Zettelkasten
source ~/dev/dotfile/vim/zettelkasten.vim

" nvim settings
if (has("nvim"))
    source ~/dev/dotfile/vim/nvim.vim
endif


