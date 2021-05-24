"" Vim mappings
" modify settings as a breeze
nnoremap <leader>, :tabnew ~/dev/dotfile/vimrc<CR>
nnoremap <leader>r :source ~/.vimrc<CR>

" open vim mappings
nnoremap <leader>om :tabnew ~/dev/dotfile/vim/maps.vim<CR>
nnoremap <leader>oM :vsplit ~/dev/dotfile/vim/maps.vim<CR>

" check the helping notes
nnoremap <leader>oh :tabnew ~/dev/notes/<CR>
nnoremap <leader>oH :vsplit ~/dev/notes/<CR>

" check the todo tasks
nnoremap <leader>ot :tabnew ~/notes/todos.tasks<CR>
" check the todo tasks in a vsplit
nnoremap <leader>oT :70 vsplit ~/notes/todos.tasks<CR>

" check my notes
nnoremap <leader>oo :tabnew ~/notes/<CR>
nnoremap <leader>oO :vsplit ~/notes/<CR>

" check my notes
nnoremap <leader>oj :tabnew ~/dev/swiss-army-knife/<CR>

" run the file through black
nnoremap <leader>b :!$(which black) -S %<CR>

" run the file through prettier
nnoremap <leader>p :!$(which prettier) --write %<CR>

" store the current session
nnoremap <leader>s :Obsession<CR>

" Toggle opening NERDTree in Version Control System mode
noremap <silent> <leader>n :NERDTreeToggleVCS<CR>

" show file in nerdtree
nnoremap <leader>m :NERDTreeFind <CR>

" just used to it
nnoremap <C-s> :w<CR>

" alias Ack -> Ack!
cnoreabbrev Ack Ack!

" manage tabs
nnoremap <leader>t :tabnew .<CR>
nnoremap <leader>v :vnew<CR>

" insert current date
nnoremap <leader>D :r! date "+\%d-\%m-\%Y \%H:\%M:\%S"<CR>
nnoremap <leader>d :r! date "+\%d-\%m-\%Y"<CR>

" yank current file name
nnoremap <leader>f :let @" = expand("%")<CR>
nnoremap <leader>F :let @" = expand("%:p")<CR>

" vsplit current file and open declaration
nmap gs :vsplit<CR>gd

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Delete the buffer without losing the split
command! Bd bp\|bd #

" Big fingers
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev WQa wqa
cnoreabbrev WQA wqa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Vs vs
cnoreabbrev vS vs
cnoreabbrev VS vs

" close-buffers https://github.com/Asheq/close-buffers.vim
nnoremap <silent> <C-q> :Bdelete menu<CR>

" Navigate around splits
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <S-Tab> <C-w><C-w>

" Easy resize
nnoremap <silent><leader>w1 :exe "vertical resize " . (winwidth(0) * 5/4)<CR> 
nnoremap <silent><leader>w2 :exe "vertical resize " . (winwidth(0) * 3/4)<CR> 

" Better buffer navigation
map <F2> :CtrlPBuffer<CR>
map <F3> :bn<CR>
map <F4> :bp<CR>
" Toggle spell check
map <F5> :setlocal spell!<CR>
" Toggle relative line numbers and regular line numbers
map <F6> :setlocal invrelativenumber<CR>
map <F7> :Goyo<CR>

" Move lines around
" Discovered thanks to Nick Janetakis https://youtu.be/gNyNm5DsQ88
nnoremap <silent><A-j> :m .+1<CR>==
nnoremap <silent><A-k> :m .-2<CR>==
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

let @f='V}kzf'
" Add vim-fugitive keybindings
nnoremap <space>gg :G<CR>
nnoremap <space>gd :G diff<CR>
nnoremap <space>gb :G branch<CR>
nnoremap <space>gB :G blame<CR>
nnoremap <space>gL :GV<CR>
nnoremap <space>gl :GV!<CR>
nnoremap <space>gf :G fetch --all --prune<CR>
