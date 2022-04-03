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
Plug 'morhetz/gruvbox'

" time-based theme changes
Plug 'displeased/vim-circadian'

" status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

" file tree plugin
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" lsp testing
"Plug 'vim-syntastic/syntastic'

"############### Syntax/Lang Plugins ###############"

" markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" groovy lang plugin
Plug 'tfnico/vim-gradle', { 'for': 'gradle' }

" rust lang plugin
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" toml plugin
Plug 'cespare/vim-toml', { 'for': 'toml' }

" yaml plugin
Plug 'mrk21/yaml-vim', { 'for': 'yaml' }

" latex integration plugin
Plug 'lervag/vimtex', { 'for': 'tex' }

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

" disable sound in Windows Terminal
set belloff=all

" force 256 color terminal
set t_Co=256
" set true color support
set termguicolors

" configure default theme 
colorscheme gruvbox 
set background=dark

" set ayu dark
let ayucolor="mirage"

" tmux reccomended settings
set ft=tmux tw=0 nowrap

" turn on mouse integration
" https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux#550482
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

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

" close NERDTree on last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

"############### FILETYPE ###############" 

" set workwrap for git commit messages to 72 
au FileType gitcommit setlocal tw=72

"############### KEYBINDS ###############" 

" keybind ctrl+n to turn off search highlighting
nmap <C-N> :nohlsearch

"############### SYNTASTIC ###############" 

" syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic settings
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"############### CIRCADIAN ###############" 

let g:circadian_day_start = 7
let g:circadian_night_start = 20

let g:circadian_day_theme = 'ayu'
let g:circadian_night_theme = 'ayu'

let g:circadian_day_cmds = "let g:ayucolor='mirage'"
let g:circadian_night_cmds= "let g:ayucolor='dark'"
