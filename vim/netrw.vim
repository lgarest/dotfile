"" netrw settings
let g:netrw_banner = 0        " remove the netrw banner
let g:netrw_liststyle = 3     " make tree list as default
let g:netrw_winsize = 25      " make netrw 25% window wide
let g:netrw_altv = 1
let g:netrw_browse_split = 2  " allow 1,2,3,4 to open files in hs,vs,tab,win

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

