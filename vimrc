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
    Plug 'rafamadriz/friendly-snippets'
    Plug 'kien/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'vim-scripts/Tabmerge'
    Plug 'ryanoasis/vim-devicons'
    Plug 'wsdjeg/vim-fetch'

    " IDE like
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    " Plug 'plasticboy/vim-markdown' " Doesn't work with coc?
    Plug 'godlygeek/tabular'
    Plug 'pantharshit00/vim-prisma' " Prisma syntax highlighting
    Plug 'preservim/vim-markdown'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-obsession'
    Plug 'crispydrone/vim-tasks'
    Plug 'yaegassy/coc-jsdoc', {'do': 'yarn install --frozen-lockfile'}
    Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
    Plug 'aarleks/zettel.vim' " Zettelkasten enhancing

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

" To open urls (gx) in WSL
let g:netrw_browsex_viewer="cmd.exe /C start"
" use with combination of export BROWSER="wslview" in zshrc

" Themes configuration
function SetDarkTheme()
    set background=dark
    colorscheme candid
endfunction

function SetLightTheme()
    set background=light
    let ayucolor="light" "| dark
    colorscheme ayu
endfunction
call SetDarkTheme()

let g:vim_markdown_folding_disabled = 1

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


