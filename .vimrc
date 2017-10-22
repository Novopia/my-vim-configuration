" vim-plug 
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'ervandew/supertab'
Plug 'mhinz/vim-startify'
Plug 'raimondi/delimitmate'
Plug 'mbbill/undotree'
Plug 'flazz/vim-colorschemes'
Plug 'moll/vim-bbye'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'majutsushi/tagbar'
Plug 'valloric/youcompleteme'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'derekwyatt/vim-fswitch'
Plug 'tpope/vim-unimpaired'
Plug 'valloric/listtoggle'
call plug#end()

" Necessary for lots of cool vim things
set nocompatible
" Syntax
syntax on
filetype plugin indent on

" Tabs
set tabstop=8
set shiftwidth=4
set expandtab

set number relativenumber " Line numbers

" Link the internal clipboard to the system's 
if $TMUX == ''
set clipboard+=unnamed
endif

" Highlighting the serached items
set hlsearch

" More intuitive split directions
set splitright
set splitbelow

" Experiment
set ruler      " Bottom right corner of the status line
set textwidth=80        " Maximum line text width
set colorcolumn=80      " Highlight column at 80 char

" No sounds
set visualbell

" Auto change directory to the current file
autocmd BufEnter * silent! lcd %:p:h

" Remap Leader Key
nnoremap <space> <Nop>
let mapleader = " "

"
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/performance.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/theme.vim
source $HOME/.vim/cscope_maps.vim
