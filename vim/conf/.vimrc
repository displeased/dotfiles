"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

set nocompatible "to be safe

" automatically install vim-plug and plugs if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"############################## Plugins ##############################

call plug#begin()

" editor tweaks
Plug 'ciaranm/securemodelines' " modelines
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'displeased/conventional.vim' " conventional commits

" color schemes
Plug 'ayu-theme/ayu-vim' " ayu dark + mirage theme
Plug 'displeased/vim-circadian' " time-based theme changes

" status bar plugin
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" distraction free writing
Plug 'junegunn/goyo.vim'

" file tree plugin
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" better startup screen
Plug 'mhinz/vim-startify'

" lang + syntax support
Plug 'rust-lang/rust.vim', { 'for': 'rust' } " rust specific support
Plug 'lervag/vimtex', { 'for': 'tex' } " latex support
Plug 'sheerun/vim-polyglot' " multiple lang support

call plug#end()

"############################## Vim Opts ##############################

filetype plugin indent on
syntax on

" sane defaults
set encoding=utf-8 " use UTF-8 encoding
set scrolloff=2 " always show 2 lines after cursor
set noshowmode " don't show message on last line
set hidden " hide buffer when not seen
set nowrap " no line wrapping
set nojoinspaces " join - no insert spaces

" better completion menu
set completeopt=menuone,noinsert,noselect

" swapfile update delay
set updatetime=300

" sane splits
set splitright
set splitbelow

" better wildcard menu
set wildmenu
set wildignore=*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o

" rendering changes
set ttyfast " faster redraw
set lazyredraw " lazily redraw

" syntax highlight changes
set synmaxcol=500 " col limit for syn
set laststatus=2 " always show bottom line
set nofoldenable " disable folding

" stop issue with insert leader
set timeoutlen=300

" color settings
set t_Co=256 " enable 256 colors
set termguicolors " true color

" configure default theme
let ayucolor="mirage" " ayu mirage default
colorscheme ayu
set background=dark " dark theme

" disable swap & backup
set nobackup
set noswapfile

" set line numbering
" set relativenumber " Relative line numbers
" set number " Also show current absolute line

" improve vimdiff
set diffopt+=iwhite " no whitespace
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

" show hidden characters
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" disable bell
set vb t_vb=

" enable mouse support
set mouse=a " mouse in all modes
set ttymouse=xterm2 " tmux mouse

" tab -> space (4) replacement
set autoindent " copy indent from prev line
set shiftwidth=4 " tab -> space = 4
set softtabstop=4 " tab/space rate
set tabstop=4 " tab/space rate
set expandtab " conv tabs to spaces

" proper search settings
set incsearch " match while typing
set ignorecase " ignores case when searching
set smartcase " only ignore case if search is lowercase
set gdefault " implicit /g in replace
set hlsearch " highlight search results

" centered search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"############################## Filetypes ##############################

" set word wrap on 72 chars and spell correction
au FileType gitcommit setlocal tw=72 spell

" word wrap on 80 chars for markdown
au FileType markdown setlocal tw=80

" we want make to use real tabs for makefiles
au FileType make set noexpandtab

" custom filetype for bats testing framework
au BufNewFile,BufRead *.bats set syn=bash ft=bash

" syntax highlight items in ~/.ssh/config.d/* as ssh configs
au BufNewFile,BufRead */.ssh/config.d/* set syn=sshconfig ft=sshconfig

"############################## Keybinds ##############################

" set <leader> to space
let mapleader = "\<Space>"

" disable arrow keys for movement
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" move by line
nnoremap j gj
nnoremap k gk
nmap <down> j
nmap <up> k

" , and . to next and prev buffers
nnoremap , :bp<CR>
nnoremap . :bn<CR>

" <leader>q close the current buffer
nnoremap <leader>q :bd!<CR>

" <leader>; to list buffers
nmap <leader>; :buffers<CR>

" new file adjacent to current buffer 
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

" <leader>w to quicksave
nmap <leader>w :w<CR>

" <leader>t to stop search highlight
vnoremap <leader>t :nohlsearch<cr>
nnoremap <leader>t :nohlsearch<cr>
" <C-N> stop search highlight (legacy)
nmap <C-N> :nohlsearch<CR>

" <leader>g open focused writing mode
nnoremap <leader>g :Goyo 50%<CR>

" <leader>d open sidebar directory listing
nnoremap <leader>d :NERDTreeToggle<CR>

" <leader>s toggle spell checking
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>f to suspend vim
vnoremap <leader>f :sus<CR>
nnoremap <leader>f :sus<CR>

" F1 != :help anymore
map <F1> <Esc>
imap <F1> <Esc>

" Q command - force quit
command Q q!

"############################## Plugin-Specific ##############################

"############### securemodelines ###############

let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

"############### nerdtree ###############

" close NERDTree on last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

"############### circadian ###############

let g:circadian_day_start = 6
let g:circadian_night_start = 20

let g:circadian_day_theme = 'ayu'
let g:circadian_night_theme = 'ayu'

" custom ayu-specific commands that need to be executed
let g:circadian_day_cmds = "let g:ayucolor = 'mirage' | let g:lightline.colorscheme = 'ayu_mirage'"
let g:circadian_night_cmds = "let g:ayucolor = 'dark' | let g:lightline.colorscheme = 'ayu_dark'"

"############### startify ###############

" apply a custom header to startify
let s:ascii_header = [
        \ '        _             ',
        \ ' __   _(_)_ __ ___    ',
        \ ' \ \ / / | ''_ ` _ \  ',
        \ '  \ V /| | | | | | |  ',
        \ '   \_/ |_|_| |_| |_|  ',
        \ '                      ',
        \ '   the text editor    ',
        \ ]
let g:startify_custom_header =
            \ startify#center(s:ascii_header)

" only show recent files section
let g:startify_lists = [
    \ { 'type': 'files', 'header': ['   Recent Files'] },
    \ ]

"############### lightline ###############

" configure component layout
let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ]],
      \   'right': [[ 'filetype', 'percent', 'lineinfo' ]]
      \ },
      \ 'tabline': {
      \   'left': [[ 'buffers' ]],
      \   'right': [[ 'close' ]]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }

"############### LIGHTLINE BUFF ###############"

" show tabline for lightline buffer
set showtabline=2

" show ordinal numbers for tabs
"let g:lightline#bufferline#show_number = 2

" disable unicode symbols for a more basic look
let g:lightline#bufferline#unicode_symbols = 0

" only show the filename and not the path
let g:lightline#bufferline#filename_modifier = ':t'

" set bufferline component raw (needed for clickable-ness)
let g:lightline.component_raw = {'buffers': 1}

" allow clickable bufferline
let g:lightline#bufferline#clickable = 1

" remap keys to switch and close buffers
nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

nmap <leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <leader>c0 <Plug>lightline#bufferline#delete(10)
