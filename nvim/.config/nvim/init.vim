"
" ~/.vimrc
"

set nocompatible
filetype off

" Plugins
" =======
" call plug#begin('~/.vim/plugged')
"   
"         Plug 'itchyny/lightline.vim'
"         Plug 'arcticicestudio/nord-vim'
" 	Plug 'morhetz/gruvbox'
" 	Plug 'ap/vim-css-color' 
" 
" call plug#end()

" Basic stuff
" ===========
set title
set noerrorbells
syntax on
set noswapfile
set nobackup
set hidden
set noshowmode
set background=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set t_Co=256
set colorcolumn=80
set cursorline
set ruler
filetype plugin indent on
syntax on
set encoding=utf-8
set number relativenumber

highlight ColorColumn ctermbg=0 guibg=black

" Text, tab and indent related
" ============================
set expandtab                   " Use spaces instead of tabs.
