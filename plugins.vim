" NerdTree Related
" Ctrl-N : Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only tab is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" FZF
map <leader>ff :Files<CR>
map <leader>gg :GFiles<CR>
map <leader>b :Buffers<CR>
map <leader>c :Colors<CR>
" Use fzf for whole line completion
imap <c-x><c-l> <plug>(fzf-complete-line)


" BBye
nnoremap <Leader>q :Bdelete<CR>

" TagBar
nmap <Leader>tt :TagbarToggle<CR>


" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YCM
" Compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']

" FSwitch
" Switch to the file and load it into the current window
nmap <silent> <Leader>mm :FSHere<cr>

" Switch to the file and load it into the window on the right
nmap <silent> <Leader>ml :FSSplitRight<cr>

" vim-unimpaired customization
" Since my keyboard doesn't have [/] close to my fingers 
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>

" CScope
set cscopequickfix=s-,c-,t-
