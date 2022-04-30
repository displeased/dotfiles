"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" poorly put together configuration file for vim

set nocompatible "to be safe

"      _               _
" __ _(_)_ __ ___ _ __| |_  _ __ _
" \ V / | '  \___| '_ \ | || / _` |
"  \_/|_|_|_|_|  | .__/_|\_,_\__, |
"                |_|         |___/

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"       _           _
"  _ __| |_  _ __ _(_)_ _  ___
" | '_ \ | || / _` | | ' \(_-<
" | .__/_|\_,_\__, |_|_||_/__/
" |_|         |___/

call plug#begin() "begin plugin declarations

" some sensible defaults
Plug 'tpope/vim-sensible'

" editorconfig plugin
Plug 'editorconfig/editorconfig-vim'

" color themes 
Plug 'ayu-theme/ayu-vim'

" time-based theme changes
Plug 'displeased/vim-circadian'

" status bar plugin
Plug 'itchyny/lightline.vim'

" distraction free writing
Plug 'junegunn/goyo.vim'

" file tree plugin
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" better startup screen
Plug 'mhinz/vim-startify'

"############### Syntax/Lang Plugins ###############"

" rust lang plugin (adds cargo support)
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" latex integration plugin
Plug 'lervag/vimtex', { 'for': 'tex' }

" plugin for multiple filetypes
Plug 'sheerun/vim-polyglot'

call plug#end() "end plugin declarations

"           _
"  ___ _ __| |_
" / _ \ '_ \  _|
" \___/ .__/\__|
"     |_|

"############### VIM CONF ###############" 

" turn on indentation + syntax highlighting
filetype plugin indent on
syntax on

" disable swap file and backup
set nobackup
set noswapfile

" disable sound in Windows Terminal
set belloff=all

" force 256 color terminal
set t_Co=256
" set true color support
set termguicolors

" set ayu dark
let ayucolor="mirage"

" configure default theme 
colorscheme ayu 
set background=dark

" tmux specific settings
if exists('$TMUX')
    set ttymouse=xterm2
    set nowrap
endif

" turn on mouse integration
" https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux#550482
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
endif

" converts tabs to spaces
set expandtab

" use four spaces instead of tabs
set tabstop=4

" the same but for indents
set shiftwidth=4

" set word warp in visual with gq
set textwidth=0

" set highlighting on search
set hlsearch

"############### FILETYPE ###############" 

" set workwrap for git commit messages to 72 
au FileType gitcommit setlocal tw=72 spell

" we want 80 columns on markdown files
au FileType markdown setlocal tw=80

" we want make to use real tabs
au FileType make set noexpandtab

" custom filetype for bats testing framework
au BufNewFile,BufRead *.bats set syn=bash ft=bash

"############### KEYBINDS ###############" 

" keybind ctrl+n to turn off search highlighting
nmap <C-N> :nohlsearch<CR>

" custom stuff that starts with ,
let mapleader = ','
nnoremap <leader>g :Goyo 50%<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

" turn Q into valid q!
command Q q!

"############### AUTOCMD ###############" 

" close NERDTree on last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

"############### CIRCADIAN ###############" 

let g:circadian_day_start = 7
let g:circadian_night_start = 20

let g:circadian_day_theme = 'ayu'
let g:circadian_night_theme = 'ayu'

let g:circadian_day_cmds = "let g:ayucolor = 'mirage' | let g:lightline.colorscheme = 'ayu_mirage'"
let g:circadian_night_cmds = "let g:ayucolor = 'dark' | let g:lightline.colorscheme = 'ayu_dark'"

"############### STARTIFY ###############" 

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

"############### LIGHTLINE ###############" 

" configure layout of components 
let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ]],
      \   'right': [[ 'filetype', 'percent', 'lineinfo' ]]
      \ }
      \ }
