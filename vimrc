execute pathogen#infect()
filetype plugin indent on

" SYNTAX
syntax on
augroup filetype javascript syntax=javascript

" INDENTATION
set hlsearch     "filetype plugin indent on
set tabstop=2    " show existing tab with 4 spaces width
set shiftwidth=2 " when indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces


" COLOR COLUMN
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" LINE NUMBERS
set number


" STATUSLINE
set laststatus=2

" returns a string <branch/XX> where XX corresponds to the git status (for example "<master/ M>")
function CurrentGitStatus()
    let gitoutput = split(system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),'\n')
    if len(gitoutput) > 0
        let b:gitstatus = strpart(get(gitoutput,0,''),3) . '/' . strpart(get(gitoutput,1,'  '),0,2)
    else
        let b:gitstatus = ''
    endif
endfunc
autocmd BufEnter,BufWritePost * call CurrentGitStatus()
" example of use in the status line:
set stl=%f\ %(<%{b:gitstatus}>%)
set stl+=%m\
set stl+=%=
set stl+=%#CursorColumn#
set stl+=\ %y
set stl+=\ %{&fileencoding?&fileencoding:&encoding}
set stl+=\[%{&fileformat}\]
set stl+=\ %p%%
set stl+=\ %l:%c
set stl+=\

colorscheme OceanicNext
