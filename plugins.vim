" NerdTree Related
" Ctrl-N : Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only tab is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" FZF
map <leader>f :Files<CR>
map <leader>g :GFiles<CR>
map <leader>b :Buffers<CR>
map <leader>c :Colors<CR>
" Use fzf for whole line completion
imap <c-x><c-l> <plug>(fzf-complete-line)


" BBye
nnoremap <Leader>q :Bdelete<CR>

" TagBar
nmap <C-m> :TagbarToggle<CR>
