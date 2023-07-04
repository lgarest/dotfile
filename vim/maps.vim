"" Vim mappings
" modify settings as a breeze
nmap <leader>, :tabnew ~/dev/dotfile/vimrc<CR>
nmap <leader>r :source ~/.vimrc<CR>

" open vim mappings
nmap <leader>om :tabnew ~/dev/dotfile/vim/maps.vim<CR>
nmap <leader>oM :vsplit ~/dev/dotfile/vim/maps.vim<CR>

" check the helping notes
nmap <leader>oh :tabnew ~/dev/notes/<CR>
nmap <leader>oH :vsplit ~/dev/notes/<CR>

" check the todo tasks
" nmap <leader>ot :tabnew ~/notes/todos.tasks<CR>
" check the todo tasks in a vsplit
nmap <leader>oT :70 vsplit ~/notes/todos.tasks<CR>

" check my notes
nmap <leader>oo :tabnew ~/dev/notes/<CR>
nmap <leader>oO :vsplit ~/dev/notes/<CR>

" check my notes
" nmap <leader>oj :tabnew ~/dev/swiss-army-knife/<CR>

" run the file through black
nmap <leader>b :!$(which black) -S %<CR>

" run the file through prettier
nmap <leader>p :!$(which prettier) --write %<CR>
nmap <leader>P :w<CR>:!$(which prettier) --config ~/dev/dotfile/prettierrc --write %<CR>
nmap <leader>e :!$(which eslint) --config ~/dev/bx-evaluation-and-selection/.eslintrc.cjs --fix %<CR>

" store the current session
nmap <leader>s :Obsession<CR>

" load the file in a node repl
nmap <leader>xf :!$(which node) -i -e "$(< %)"<CR>
nmap <leader>xx :. !sh<CR>
vmap <leader>xx :. !sh<CR>


" Toggle opening NERDTree in Version Control System mode
noremap <silent> <leader>n :NERDTreeToggleVCS<CR>
" Toggle opening NERDTree in VCS mode and close other windows
noremap <silent> <leader>N :NERDTreeToggleVCS<CR><C-w>o

" show file in nerdtree
nmap <leader>m :NERDTreeFind <CR>
" show file in nerdtree and close other windows
nmap <leader>M :NERDTreeFind <CR><C-w>o

" tmux sessionizer
nmap <silent> <C-f> :silent !tmux neww tmux-sessionizer.sh<CR>
nmap <silent> <C-s> :silent !tmux neww tmux-fzf-session.sh<CR>

" alias Ack -> Ack!
cnoreabbrev Ack Ack!

" manage tabs
nmap <leader>tn :tabnew .<CR>
nmap <leader>tt :tabnew %<CR>
nmap <leader>to :tabonly<CR>
nmap <leader>v :vnew<CR>

" insert current date
nmap <leader>D :r! date "+\%d-\%m-\%Y \%H:\%M"<CR>
nmap <leader>d :r! date "+\%d-\%m-\%Y"<CR>

" yank current file name
nmap <leader>f :let @" = expand("%")<CR>
nmap <leader>F :let @" = expand("%:p")<CR>

" vsplit current file and open declaration
nmap gs :vsplit<CR>gd
noremap gF :vsplit<CR>gf

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
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev Vs vs
cnoreabbrev vS vs
cnoreabbrev VS vs

" close-buffers https://github.com/Asheq/close-buffers.vim
nmap <silent> <C-q> :Bdelete menu<CR>

" Navigate around splits
nmap <C-h> <C-w><C-h>
nmap <C-l> <C-w><C-l>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <S-Tab> <C-w><C-w>


" Easy resize
nmap <silent><leader>w1 :exe "vertical resize " . (winwidth(0) * 5/4)<CR> 
nmap <silent><leader>w2 :exe "vertical resize " . (winwidth(0) * 3/4)<CR> 

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
nmap <silent><A-j> :m .+1<CR>==
nmap <silent><A-k> :m .-2<CR>==
vmap <silent><A-j> :m '>+1<CR>gv=gv
vmap <silent><A-k> :m '<-2<CR>gv=gv

" Setup macro for folding by scope
let @f='V}kzf'
let @s='vi{zf'
let @g='v%zf'
" Setup macro for indenting by scope
let @i='V}k='

" Todos
let maplocalleader="\<space>"

" Add vim-fugitive keybindings
" nmap <space>gg :tab G<CR>
nmap <space>gg :tab G<CR>g?
nmap <space>gd :tab G diff<CR>
nmap <space>gb :G branch<CR>
nmap <space>gB :G blame<CR>
nmap <space>gL :GV<CR>
nmap <space>gl :GV!<CR>
nmap <space>gf :G fetch --all --prune<CR>
nmap <space>grm :G rebase origin/main<CR>
