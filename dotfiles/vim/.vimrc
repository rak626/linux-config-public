" ============================================================
" VIM CONFIG (MODERN + MINIMAL + MAINTAINABLE)
" Location: ~/.vimrc
" ============================================================



" ============================================================
" 1. CORE SETTINGS
" ============================================================

" Enable syntax highlighting
syntax on

" Enable filetype detection + plugins + indent
filetype plugin indent on

" Line numbers (hybrid mode)
set number
set relativenumber

" Better scrolling context
set scrolloff=8

" Tabs & indentation (adjust per language if needed)
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Enable mouse (optional but useful)
set mouse=a

" Clipboard (use system clipboard)
set clipboard=unnamedplus

" Better backspace behavior
set backspace=indent,eol,start

" Performance
set updatetime=300

" Disable swap files (optional)
set noswapfile



" ============================================================
" 2. SEARCH SETTINGS
" ============================================================

set incsearch      " incremental search
set hlsearch       " highlight matches
set ignorecase     " case insensitive
set smartcase      " case sensitive if uppercase used



" ============================================================
" 3. LEADER KEY
" ============================================================

let mapleader=" "



" ============================================================
" 4. INSERT MODE IMPROVEMENTS
" ============================================================

" Faster escape
inoremap jk <Esc>
inoremap kj <Esc>



" ============================================================
" 5. NORMAL MODE REMAPS
" ============================================================

" Disable Ex mode
nnoremap Q <nop>

" Clear search highlight on Esc
nnoremap <Esc> :nohlsearch<CR>

" Keep cursor centered during search navigation
nnoremap n nzzzv
nnoremap N Nzzzv

" Better line navigation
nnoremap H ^
nnoremap L $



" ============================================================
" 6. WINDOW NAVIGATION
" ============================================================

" Easier split navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Split creation
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>



" ============================================================
" 7. FILE OPERATIONS
" ============================================================

" Save & quit shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Reload config
nnoremap <leader>sv :source ~/.vimrc<CR>



" ============================================================
" 8. TOGGLES (QUALITY OF LIFE)
" ============================================================

" Toggle relative numbers
nnoremap <leader>n :set relativenumber!<CR>

" Toggle search highlight
nnoremap <leader>hls :set hlsearch!<CR>



" ============================================================
" 9. EDITING PRODUCTIVITY
" ============================================================

" Better paste (doesn't overwrite register)
vnoremap p "_dP

" Move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv



" ============================================================
" 10. OPTIONAL: COLORS & UI
" ============================================================

set termguicolors
set cursorline

" Try built-in colorscheme (change if you want)
colorscheme desert



" ============================================================
" END
" ============================================================
" Keep it minimal. Add features only when needed.
" ============================================================
