"" nvim settings
" enable python plugins support for nvim
" by specifying the python executable
" let g:python3_host_prog = '/Users/luis/venvs/py3nvim/bin/python'
let g:python3_host_prog = '/home/luis/venvs/py3nvim/bin/python'
let g:coc_node_path = '/home/luis/.nvm/versions/node/v16.13.1/bin/node'

"" mappings
" Terminal support inside nvim
" remap Escape -> Ctrl+\ Ctrl+n
tnoremap <Esc> <C-\><C-n>
" remap Ctrl+[ -> Esc
tnoremap <A-[> <Esc>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" " open terminal on ctrl+n
" function! OpenTerminal()
"   split term://zsh
"   resize 10
" endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>
