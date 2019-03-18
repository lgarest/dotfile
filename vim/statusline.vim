function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" returns a string <branch/XX> where XX corresponds to the git status
" (for example "<master/ M>")
function! CurrentGitStatus()
  let l:branchName = GitBranch()
  return strlen(l:branchName) > 0 ?''.l:branchName.'':''
endfunc

" if has("autocmd")
"     autocmd BufEnter,BufWritePost * call CurrentGitStatus()
" endif
set stl =[%n]\ %f\ %(<%{CurrentGitStatus()}>%)
set stl +=%m\
set stl +=%=
set stl +=%#CursorColumn#

set stl +=\ %l/%L:%c " line/totallines:character
set stl +=\ %p%% " % in the file
set stl +=\ %y " language
" set stl +=\ [%{kite#statusline()}%=] " kitestatus
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set stl +=\ %{&fileencoding?&fileencoding:&encoding} " fileencoding

