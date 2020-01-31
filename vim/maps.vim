"" noremaps
" modify sesttings as a breeze
nnoremap <leader>, :tabnew ~/dev/dotfile/vimrc<CR>
" check the helping notes
nnoremap <leader>h :tabnew ~/dev/notes/<CR>
" check the list of tasks to do
nnoremap <leader>l :tabnew ~/dev/easygrow_backend/src/clean.db.txt<CR>
" run the file through black
nnoremap <leader>b :!black -l 100 %<CR>
" create a session
nnoremap <leader>m :mks! /tmp/session.vim

cnoreabbrev Ack Ack!
" quick find
nnoremap <leader>a "tyiw:Ack! '<C-r>t'<space>
vnoremap <leader>a "ty:Ack! '<C-r>t'<space><Home>

" manage tabs
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>t :tabnew .<CR>
nnoremap <leader>v :vnew<CR>
nnoremap <leader>D :r! date "+\%d-\%m-\%Y \%H:\%M:\%S"<CR>
nnoremap <leader>d :r! date "+\%d-\%m-\%Y"<CR>
nnoremap <leader>f :let @" = expand("%")<CR>
nnoremap <leader>F :let @" = expand("%:p")<CR>

" Truly toggl the netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout! " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
noremap <silent> <leader>n :call ToggleNetrw()<CR>

nnoremap <leader>. :CtrlPTag<cr>


if(has("nvim"))
    tnoremap <Esc> <C-\><C-n>
    tnoremap <A-[> <Esc>
endif
