" Original author: https://github.com/EdwinWenink
" https://www.edwinwenink.xyz/posts/48-vim_fast_creating_and_linking_notes/

let g:zettelkasten = "/home/luis/notes/zettelkasten/"

command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"

nnoremap <leader>nz :NewZettel 

" CtrlP function for inserting a markdown link with Ctrl-X
function! CtrlPOpenFunc(action, line)
   if a:action =~ '^h$'    
      " Get the filename
      let filename = fnameescape(fnamemodify(a:line, ':t'))
      let filename_wo_timestamp = fnameescape(fnamemodify(a:line, ':t:s/\d\+-//'))

      " Close CtrlP
      call ctrlp#exit()
      call ctrlp#mrufiles#add(filename)

      " Insert the markdown link to the file in the current buffer
	  let mdlink = "[".filename_wo_timestamp."](/home/luis/notes/zettelkasten/".filename.")"
      put=mdlink
  else    
      " Use CtrlP's default file opening function
      call call('ctrlp#acceptfile', [a:action, a:line])
   endif
endfunction

let g:ctrlp_open_func = { 
         \ 'files': 'CtrlPOpenFunc',
         \ 'mru files': 'CtrlPOpenFunc' 
         \ }
