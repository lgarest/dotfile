"" Vim mappings
" modify settings as a breeze
nnoremap <leader>, :tabnew ~/dev/dotfile/vimrc<CR>

" check the helping notes
nnoremap <leader>h :tabnew ~/dev/notes/<CR>

" check the list of tasks to do
nnoremap <leader>l :tabnew /tmp/todos.txt<CR>

" run the file through black
nnoremap <leader>b :!$(which black) -l 100 %<CR>

" run the file through prettier
nnoremap <leader>p :!node_modules/.bin/prettier --write %<CR>

" store the current session
nnoremap <leader>s :mks! /tmp/session.vim<CR>

" alias Ack -> Ack!
cnoreabbrev Ack Ack!

" quick find
nnoremap <leader>a "tyiw:Ack! --ignore-dir venv/ '<C-r>t'<space>
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
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gD :YcmCompleter GoToReferences<CR>

" CtrlP in Buffer mode
" nnoremap <leader>. :CtrlPBuffer<cr>



nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
