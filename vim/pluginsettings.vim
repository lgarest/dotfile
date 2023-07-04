
" ctrlP plugin ignores
set wildignore+=*/tmp/*,*/htmlcov/*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](venv|\.git|htmlcov|\.?node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_cmd = 'CtrlPMRU'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <C-P> :CtrlPMRU<CR>
let g:ctrlp_mruf_relative = 1


" ack plugin
let g:ack_default_options = " -s -H --nopager --column -i"

" goyo plugin
let g:goyo_height = 100

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

"" Airline plugin
let g:airline_skip_empty_sections = 1 " remove separators for empty sections
let g:airline_inactive_collapse=1 " inactive windows should have the left section collapsed to only the filename
let g:airline_powerline_fonts = 1 " enable powerline fonts
" let g:airline_stl_path_style = 'short' " display a short path in statusline: >
let g:airline#extensions#branch#displayed_head_limit = 15 " trim long branch names
"" Coc integration
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1 " enable coc status
let airline#extensions#coc#error_symbol = 'E'
let airline#extensions#coc#warning_symbol = 'W'
"" Sections redefinition
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0 "" Remove file encoding

" vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" " YouCompleteMe
" let g:ycm_confirm_extra_conf = 0
" " use the python version of the virtualenv to do completions
" let g:ycm_python_binary_path = split(system("which python"))[0]


" NERDTree https://github.com/preservim/nerdtree
" Close vim if the only window left is NERDtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == 'Session.vim' | NERDTree | endif
let g:NERDTreeIgnore = ['^node_modules']

" UltiSnippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/dev/dotfile/snippets"]

" ---- COC CONFIG ----
" coc config
" \ 'coc-python',
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-pyright',
    \ 'coc-terminal',
    \ 'coc-webview',
    \ 'coc-markdownlint',
    \ 'coc-markdown-preview-enhanced',
    \ 'coc-markmap',
    \ 'coc-emoji',
    \ 'coc-sh'
\ ]
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/vue')
  let g:coc_global_extensions += ['coc-vetur']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/prisma')
  let g:coc_global_extensions += ['coc-prisma']
endif

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent>K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <silent><space>rr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>A :CocAction<CR>

" Remap keys for applying codeAction to the current line.
nmap <leader>A  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Terminal toggle
nmap <silent> <C-n> <Plug>(coc-terminal-toggle)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" COC Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Project search term
nnoremap <space>f :CocSearch -S 
" Project search current word
nnoremap <silent><space>F yiw :CocSearch -S <C-R>0<CR>
" Project search @TODO
nnoremap <silent><space>t :CocSearch -S @TODO <CR>


" " Sublime-like C-D to multiselect words
" nmap <expr> <silent> <C-d> <SID>select_current_word()
" function! s:select_current_word()
"   if !get(b:, 'coc_cursors_activated', 0)
"     return "\<Plug>(coc-cursors-word)"
"   endif
"   return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" ---- END OF COC CONFIG ----

