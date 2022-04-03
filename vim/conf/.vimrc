"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" poorly put together configuration file for vim


"      _               _
" __ _(_)_ __ ___ _ __| |_  _ __ _
" \ V / | '  \___| '_ \ | || / _` |
"  \_/|_|_|_|_|  | .__/_|\_,_\__, |
"                |_|         |___/
"
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

call plug#begin()

" editorconfig plugin
Plug 'editorconfig/editorconfig-vim'

" color themes 
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'

" time-based theme changes
Plug 'jonstoler/werewolf.vim'

" latex integration plugin
Plug 'lervag/vimtex'

" official rust plugin
Plug 'rust-lang/rust.vim'

" status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" markdown plugin
Plug 'plasticboy/vim-markdown'

" groovy lang plugin
" for making build.gradle
Plug 'tfnico/vim-gradle'

" toml plugin
Plug 'cespare/vim-toml'

" yaml plugin
Plug 'mrk21/yaml-vim'

" file tree plugin
Plug 'preservim/nerdtree'

" lsp testing
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'vim-syntastic/syntastic'

call plug#end()

"           _
"  ___ _ __| |_
" / _ \ '_ \  _|
" \___/ .__/\__|
"     |_|

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

"############### WEREWOLF ###############" 
let g:werewolf_day_themes = ['gruvbox']
let g:werewolf_night_themes = ['ayu']

" default 8, use 24 hour format
let g:werewolf_day_start = 7
" default 20, 24 hour format
let g:werewolf_day_end = 20

"############### VIM CONF ###############" 

" to be safe 
set nocompatible

" turn on built-in syntax highlighting
syntax on

" disable sound in Windows Terminal
set belloff=all

" force 256 color terminal
set t_Co=256
" set true color support
set termguicolors

colorscheme gruvbox 
let ayucolor="dark"
set background=dark

" tmux reccomended settings
set ft=tmux tw=0 nowrap

" turn on mouse integration
" https://www.varstack.com/2015/06/30/Mouse-with-vim/
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

" keybind ctrl+n to turn off search highlighting
nmap <C-N> :nohlsearch

" open NERDTree on open
"autocmd VimEnter * NERDTree

" close NERDTree on last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

filetype plugin indent on
