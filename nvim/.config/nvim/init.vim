"
" ~/.config/nvim/init.vim
"

call plug#begin(stdpath('data') . '/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dracula/vim', { 'name': 'dracula' }       
Plug 'ap/vim-css-color' 

call plug#end()

set nocompatible
filetype off

" Set
" ------------------------------------------------------------------------------
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
set encoding=utf-8
set number relativenumber

set expandtab                   " Use spaces instead of tabs.
set tabstop=4
set shiftwidth=4

highlight ColorColumn ctermbg=0 guibg=black

syntax enable
colorscheme tempus_night
