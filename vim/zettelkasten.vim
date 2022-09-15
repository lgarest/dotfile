" Original author: https://github.com/EdwinWenink
" https://www.edwinwenink.xyz/posts/48-vim_fast_creating_and_linking_notes/

" Zettelkasten
let g:zettelkasten = '/home/luis/dev/notes/zettelkasten'

" CREATE:
" Create a new zettel
function! NewZettel(...) abort
    " Make a unique filename
    let zettelname = g:zettelkasten . strftime("%Y%m%d%H%M") . join(a:000, '-') . '.md'
    execute "edit " . zettelname
    execute "-1read " . g:zettelkasten . "/assets/template.md"
    " add in filename as title in the document
    execute "normal! 2GA"
endfunction
" command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
command! -nargs=1 CreateNewZettel :call NewZettel("-<args>")

nnoremap <leader>nz :CreateNewZettel 
nnoremap <leader>zm :CreateNewZettel 
nnoremap <leader>zz :vsplit ~/notes/zettelkasten/zettelkasten.home.md<CR>

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


