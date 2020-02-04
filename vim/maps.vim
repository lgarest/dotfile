"" Vim mappings
" modify settings as a breeze
nnoremap <leader>, :tabnew ~/dev/dotfile/vimrc<CR>

" check the helping notes
nnoremap <leader>h :tabnew ~/dev/notes/<CR>

" check the list of tasks to do
nnoremap <leader>l :tabnew ~/dev/easygrow_backend/src/clean.db.txt<CR>

" run the file through black
nnoremap <leader>b :!black -l 100 %<CR>

" store the current session
nnoremap <leader>s :mks! /tmp/session.vim

" alias Ack -> Ack!
cnoreabbrev Ack Ack!

" quick find
nnoremap <leader>a "tyiw:Ack! '<C-r>t'<space>
vnoremap <leader>a "ty:Ack! '<C-r>t'<space><Home>

" fast gitblame
nnoremap <leader>B :Gblame<CR>

" manage tabs
nnoremap <leader>q :tabclose<CR>
nnoremap <leader>t :tabnew .<CR>
nnoremap <leader>v :vnew<CR>

" insert current date
nnoremap <leader>D :r! date "+\%d-\%m-\%Y \%H:\%M:\%S"<CR>
nnoremap <leader>d :r! date "+\%d-\%m-\%Y"<CR>

" yank current file name
nnoremap <leader>f :let @" = expand("%")<CR>
nnoremap <leader>F :let @" = expand("%:p")<CR>


"" Plugin mappings
" You complete me go to declaration
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>

" CtrlP in Tag mode
nnoremap <leader>. :CtrlPTag<cr>

