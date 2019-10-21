
" ctrlP plugin ignores
set wildignore+=*/tmp/*,*/htmlcov/*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(venv|git|htmlcov|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" emmet plugin
" enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" let g:user_emmet_expandabbr_key='<Tab>'
" enable emmet in all modes
let g:user_emmet_mode='inv'
" use double , as emmet expander
let g:user_emmet_leader_key=','

" airline plugin
" display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'