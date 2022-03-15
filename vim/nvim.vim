"" nvim settings

" enable node plugins support for nvim
let g:coc_node_path = trim(system('which node'))
" let g:coc_npm_path = trim(system('which npm'))
let g:coc_node_path = '/home/luis/.nvm/versions/node/v16.13.1/bin/node'

" enable python plugins support for nvim
" let g:python3_host_prog = '/Users/luis/venvs/py3nvim/bin/python'
let g:python3_host_prog = '/home/luis/venvs/py3nvim/bin/python'


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
