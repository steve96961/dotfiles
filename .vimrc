inoremap kj <Esc>
" Control+Shift+C Copy in Wayland
nnoremap <C-@> :call system("wl-copy", @")<CR>

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

call plug#begin()

Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'LunarWatcher/auto-pairs'
Plug 'maxboisvert/vim-simple-complete'
Plug 'https://github.com/ap/vim-css-color'

call plug#end()

" Enable plugins and load plugin for the detected file type.
filetype plugin indent on

set mouse=a

set hlsearch
" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set shift width to 4 spaces.
set shiftwidth=4

" Show line numbers.
" Activate Hybrid line numbers
set relativenumber 
set number 

" Show file stats.
set ruler

" Blink cursor on error instead of beeping.
set visualbell

" Encoding.
set encoding=utf-8

" Security.
set modelines=0

" Show color column at 80 characters width, visual reminder of keepingcode line within a popular line width.
" set colorcolumn=80

"Whitespace.
set wrap
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Allow hidden buffers.
set hidden

" Rendering.
set ttyfast

" Status bar.
set laststatus=2

" Last line.
set showmode
set showcmd
