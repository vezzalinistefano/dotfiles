call plug#begin('~/.vim/plugged')
  
        Plug 'itchyny/lightline.vim'
        Plug 'arcticicestudio/nord-vim'
	Plug 'morhetz/gruvbox'
	Plug 'ap/vim-css-color' 

call plug#end()

set title
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

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

if has('termguicolors')
	set termguicolors
endif

set laststatus=2
colorscheme gruvbox
let g:lightline = { 
	\ 'colorscheme': 'gruvbox',
	\ }
