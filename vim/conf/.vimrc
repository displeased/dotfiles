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

" gruvbox theme plugin
Plugin 'morhetz/gruvbox'

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

" file tree plugin
Plugin 'preservim/nerdtree'

" lsp testing
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'mattn/vim-lsp-settings'

"           _
"  ___ _ __| |_
" / _ \ '_ \  _|
" \___/ .__/\__|
"     |_|

" turn on built-in syntax highlighting
syntax on

" disable sound in Windows Terminal
set belloff=all

" setup gruvbox theme by:
" - setting to 256 colors
" - setting the theme
" - setting it dark
set t_Co=256
colo gruvbox
set background=dark

" tmux
set ft=tmux tw=0 nowrap

" turn on mouse integration
" https://www.varstack.com/2015/06/30/Mouse-with-vim/
set mouse=a

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
