" For tpope/vim-pathogen
"execute pathogen#infect()

" vim-plug 
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'shougo/unite.vim'
Plug 'shougo/neomru.vim'
Plug 'shougo/unite-outline'
Plug 'shougo/neoyank.vim'
Plug 'shougo/vimproc.vim', {'do' : 'make'}
call plug#end()


" Syntax
syntax on
filetype plugin indent on

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" More intuitive cursor movements
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Theme & Font
set background=light

" Line numbers
set number

" Link the internal clipboard to the system's 
set clipboard=unnamed

" Highlighting the serached items
set hlsearch

" NerdTree/Tagbar
" nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTree<CR>

" Navigation
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" More intuitive split directions
set splitright
set splitbelow


" Unite
" nnoremap <C-p> :Unite file_rec<CR>
" nnoremap <C-l> :Unite file file_rec buffer file_mru<CR>
" nnoremap <C-;> :Unite line<CR>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>l :<C-u>Unite -no-split -buffer-name=line -start-insert line<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


