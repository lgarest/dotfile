"" Vim mappings
" modify settings as a breeze
nnoremap <leader>, :tabnew ~/dev/dotfile/vimrc<CR>

" check the helping notes
nnoremap <leader>oh :tabnew ~/dev/notes/<CR>

" check my notes
nnoremap <leader>oo :tabnew ~/notes/<CR>

" check my notes
nnoremap <leader>oj :tabnew ~/dev/swiss-army-knife/<CR>

" run the file through black
nnoremap <leader>b :!$(which black) -S %<CR>

" run the file through prettier
nnoremap <leader>p :!node_modules/.bin/prettier --write %<CR>

" store the current session
nnoremap <leader>s :mks! /tmp/session.vim<CR>

" alias Ack -> Ack!
cnoreabbrev Ack Ack!

" quick find
" nnoremap <leader>A "tyiw:Ack! --ignore-dir venv/ '<C-r>t'<space>
" vnoremap <leader>A "ty:Ack! --ignore-dir venv/' <C-r>t'<space><Home>

" fast gitblame
nnoremap <leader>B :Gblame<CR>

" manage tabs
nnoremap <leader>t :tabnew .<CR>
nnoremap <leader>v :vnew<CR>

" insert current date
nnoremap <leader>D :r! date "+\%d-\%m-\%Y \%H:\%M:\%S"<CR>
nnoremap <leader>d :r! date "+\%d-\%m-\%Y"<CR>

" yank current file name
nnoremap <leader>f :let @" = expand("%")<CR>
nnoremap <leader>F :let @" = expand("%:p")<CR>

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Delete the buffer without losing the split
command! Bd bp\|bd #

" Big hands
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Vs vs
cnoreabbrev vS vs
cnoreabbrev VS vs


"" Plugin mappings
" You complete me go to declaration
" nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gD :YcmCompleter GoToReferences<CR>

" close-buffers https://github.com/Asheq/close-buffers.vim
nnoremap <silent> <C-q> :Bdelete menu<CR>

" CtrlP in Buffer mode
" nnoremap <leader>. :CtrlPBuffer<cr>


" Navigate around splits
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <S-Tab> <C-w><C-w>

" Easy resize
" nnoremap <silent><leader>w1 :exe "vertical resize " . (winwidth(0) * 3/2)<CR> 
" nnoremap <silent><leader>w2 :exe "vertical resize " . (winwidth(0) * 2/3)<CR> 
nnoremap <silent><leader>w1 :exe "vertical resize " . (winwidth(0) * 5/4)<CR> 
nnoremap <silent><leader>w2 :exe "vertical resize " . (winwidth(0) * 3/4)<CR> 

" Toggle spell check
map <F5> :setlocal spell!<CR>
" Toggle relative line numbers and regular line numbers
map <F6> :setlocal invrelativenumber<CR>
