" Load plugins via pathogen
execute pathogen#infect()

if (has("termguicolors"))
  set termguicolors
endif

" colorscheme OceanicNext
" let g:airline_theme='base16_oceanicnext'
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

