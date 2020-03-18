
" ctrlP plugin ignores
set wildignore+=*/tmp/*,*/htmlcov/*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](venv|\.git|htmlcov|\.node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ack plugin
let g:ack_default_options = " -s -H --nopager --column -i"

" emmet plugin
" enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" let g:user_emmet_expandabbr_key='<Tab>'
" enable emmet in all modes
let g:user_emmet_mode='inv'
" use double , as emmet expander
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" airline plugin
" display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 0

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
" use the python version of the virtualenv to do completions
let g:ycm_python_binary_path = split(system("which python"))[0]
