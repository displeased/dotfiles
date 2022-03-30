"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" poorly put together configuration file for vim

" turn default file detection off
set nocompatible
filetype off

" set runtime path to include Vundle
" and call Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"       _           _
"  _ __| |_  _ __ _(_)_ _  ___
" | '_ \ | || / _` | | ' \(_-<
" | .__/_|\_,_\__, |_|_||_/__/
" |_|         |___/

" editorconfig plugin
" more info: https://editorconfig.org/
Plugin 'editorconfig/editorconfig-vim'

" ayu theme plugin
Plugin 'ayu-theme/ayu-vim'

" latex integration plugin
Plugin 'lervag/vimtex'

" official rust plugin
Plugin 'rust-lang/rust.vim'

" status bar plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" markdown plugin
Plugin 'plasticboy/vim-markdown'

" groovy lang plugin
" for making build.gradle
Plugin 'tfnico/vim-gradle'

" toml plugin
Plugin 'cespare/vim-toml'

" yaml plugin
Plugin 'mrk21/yaml-vim'

" file tree plugin
Plugin 'preservim/nerdtree'

" lsp testing
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'mattn/vim-lsp-settings'
"Plugin 'vim-syntastic/syntastic'

"           _
"  ___ _ __| |_
" / _ \ '_ \  _|
" \___/ .__/\__|
"     |_|

" syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic settings
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" turn on built-in syntax highlighting
syntax on

" disable sound in Windows Terminal
set belloff=all

" setup ayu theme by
" - setting term to 256 colors
" - setting true color support 
" - setting the colorscheme to ayu
" - setting the flavor of ayu to mriage
set t_Co=256
set termguicolors

colorscheme ayu
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
" note: you must hit enter after ctrl+n
nmap <C-N> :nohlsearch

" open NERDTree on open
"autocmd VimEnter * NERDTree

" close NERDTree on last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree()) | q | endif

" mandatory call to vundle
call vundle#end()
filetype plugin indent on
