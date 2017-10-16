
" More intuitive cursor movements
" You can press j to move down one physical line, or gj to move down one
" displayed line. My opinion is that displayed line is more intuitive.
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" More Intuitive Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Buffers
nnoremap <leader>[ :bp<CR> 
nnoremap <leader>] :bn<CR> 
