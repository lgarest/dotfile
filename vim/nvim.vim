"" nvim settings
" enable python plugins support for nvim
" by specifying the python executable
" let g:python3_host_prog = '/Users/luis/venvs/py3nvim/bin/python'
let g:python3_host_prog = '/home/luis/venvs/py3nvim/bin/python'
let g:coc_node_path = '/home/luis/.nvm/versions/node/v15.2.1/bin/node'

"" mappings
" Terminal support inside nvim
" remap Escape -> Ctrl+\ Ctrl+n
tnoremap <Esc> <C-\><C-n>
" remap Ctrl+[ -> Esc
tnoremap <A-[> <Esc>
