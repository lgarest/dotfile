" returns a string <branch/XX> where XX corresponds to the git status
" (for example "<master/ M>")
function CurrentGitStatus()
    let gitoutput = split(
      \ system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),
      \ '\n')
    if len(gitoutput) > 0
        let b:gitstatus = 
          \ strpart(get(gitoutput,0,''),3) . '/' . strpart(get(gitoutput,1,'  '),0,2)
    else
        let b:gitstatus = ''
    endif
endfunc

if has("autocmd")
    autocmd BufEnter,BufWritePost * call CurrentGitStatus()
endif
set stl =[%n]\ %f\ %(<%{b:gitstatus}>%)
set stl +=%m\
set stl +=%=
set stl +=%#CursorColumn#

set stl +=\ %l/%L:%c " line/totallines:character
set stl +=\ %p%% " % in the file
set stl +=\ %y " language
" set stl +=\ [%{kite#statusline()}%=] " kitestatus
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set stl +=\ %{&fileencoding?&fileencoding:&encoding} " fileencoding

