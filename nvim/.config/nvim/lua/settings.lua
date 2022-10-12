local o = vim.opt

o.path 				= o.path + '**'
o.wildmenu 			= true
o.incsearch 		= true
o.hidden 			= true
o.backup 			= false
o.swapfile 			= false
o.number 			= true
o.relativenumber 	= true
o.cursorline 		= true
o.ruler 			= true
o.clipboard 		= 'unnamedplus'
o.fileencoding 		= 'UTF-8'
o.termguicolors 	= true
o.incsearch 		= true
o.completeopt 		= 'menu,menuone,noselect'
o.termguicolors 	= true

-- Tab and indent related
o.tabstop 			= 4
o.shiftwidth 		= 4

-- Colors
o.syntax 			= 'enable'
vim.cmd([[colorscheme gruvbox]])



