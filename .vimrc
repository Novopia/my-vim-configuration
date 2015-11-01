execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"更符合人的split习惯
set splitright
set splitbelow

"主题
set background=light

"自定义字体
set guifont=Monaco:h12

"NerdTree/Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTree<CR>
:set pastetoggle=<f5>

"cursor-maps
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

"显示行号
set number

"显示搜索项
set hlsearch

"folding settings
set foldmethod=syntax   "fold based on indent
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set mouse=a

"commenter
filetype plugin on

"自动补全edit后文件,remap %% => %:h
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
