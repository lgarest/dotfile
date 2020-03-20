"" netrw settings
let g:netrw_banner = 0        " remove the netrw banner
let g:netrw_liststyle = 3     " make tree list as default
let g:netrw_winsize = 20      " make netrw 20% window wide
let g:netrw_browse_split = 2  " allow 1,2,3,4 to open files in hs,vs,tab,win
let g:netrw_altv = 1

" Truly toggl the netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        " if netrw is open, iterate over the buffers,
        " find the netrw one and close it
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout! " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        " if netrw is closed, open it 
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
" Disable this behaviour when using NERDTree
" noremap <silent> <leader>n :call ToggleNetrw()<CR>
