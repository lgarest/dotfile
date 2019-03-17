" set_trace python snippet
au FileType python map <silent> <leader>b ofrom pudb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>B Ofrom pudb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>i ofrom ipdb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>I Ofrom ipdb import set_trace; set_trace()<esc>

