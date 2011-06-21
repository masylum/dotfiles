call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" CONF {
" --------------------------------

"Set leader key
let mapleader = ","
set nocompatible " We don't want vi compatibility.

" Ignore extension files
set wildignore=*.dll,*.o,*.obj,*.bak,*.pyc,*.swp " ignore these"
set term=ansi
set termencoding=utf-8
set encoding=utf-8
"}


" VISUALS {
" --------------------------------
set nowrap
set showmatch " show matching brackets
set showcmd

" show hidden chars
set list
set listchars=tab:->,trail:_

"Show menu with possible tab competions
set wildmenu

syntax enable
colorscheme solarized

if has("gui_running")
    set background=light
else
    set background=dark
endif

set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
"}


" PLUGINS {
" --------------------------------

" Minibuffer Explorer Settings
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" NERDTree
let NERDTreeShowBookmarks = 1
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
"}

set tabstop=2 " Tabs are 2 spaces
set softtabstop=2
set shiftwidth=2 " Tabs under smart indent
set autoindent
set smartindent
filetype plugin indent on
set smarttab
set expandtab

"Curor line
set cursorline
set number

"Allow switching buffers without writing to disk
set hidden

" SEARCH {
" --------------------------------
" Set incremental search
set incsearch
set hlsearch

" Set ignorecase
set ignorecase
set smartcase
"}


" Set terminal title to filename
set title

" Mappings {

vnoremap < <gv
vnoremap > >gv

map Y y$
map <leader>n <ESC>:NERDTreeToggle<RETURN>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" }


" GUI STUFF
if has("gui_running")
    set guioptions-=T " no toolbar set guioptions-=m " no menus
    set guioptions-=r " no scrollbar on the right
    set guioptions-=R " no scrollbar on the right
    set guioptions-=l " no scrollbar on the left
    set guioptions-=b " no scrollbar on the bottom

    set guifont=*
    set guifont=Monaco:h14
endif
