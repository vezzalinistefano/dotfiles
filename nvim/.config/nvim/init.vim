"
" ~/.config/nvim/init.vim
"

set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'ap/vim-css-color' 
    Plug 'preservim/nerdtree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plug 'morhetz/gruvbox'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'tpope/vim-fugitive'

    Plug 'nvim-lualine/lualine.nvim'
    " If you want to have icons in your statusline choose one of these
    Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'jreybert/vimagit'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

set path+=**
set wildmenu
set incsearch
set hidden
set nobackup
set noswapfile
set number relativenumber
set clipboard=unnamedplus
syntax enable
highlight ColorColumn ctermbg=0 guibg=black
set cursorline
set ruler
"set laststatus=2
set noshowmode
set mouse=a
set background=dark

" Text, tab and indent related
" ----------------------------
set expandtab                   " Use spaces instead of tabs.
set smarttab
set tabstop=4
set shiftwidth=4

" Remaps
" ----------------------------
inoremap jj <Esc>

" NERDTree
" ----------------------------
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=38
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

" FZF
" ----------------------------
nnoremap <C-p> :Files<Cr>

" set noerrorbells
" syntax on
" set noswapfile
" set nobackup
" set hidden
" set noshowmode
" set background=dark
" set go=a
" set mouse=a
" set nohlsearch
" set clipboard+=unnamedplus
" set noshowmode
" set noruler
" set laststatus=0
" set noshowcmd
" set t_Co=256
" set colorcolumn=80
" set cursorline
" set ruler
" set encoding=utf-8
" set number relativenumber

highlight ColorColumn ctermbg=0 guibg=black

lua require("sv")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

set termguicolors
colorscheme catppuccin "tempus_night
