
" ctrlP plugin ignores
set wildignore+=*/tmp/*,*/htmlcov/*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(venv|git|htmlcov|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" Ale settings
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let b:ale_linters = {'javascript': ['eslint'], 'python': ['flake8', 'pylint']}
let g:ale_linters_explicit = 1

