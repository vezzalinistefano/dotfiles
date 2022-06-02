vim.opt.path = vim.opt.path + '**'
vim.opt.wildmenu = true
vim.opt.incsearch = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.fileencoding = 'UTF-8'
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.completeopt = 'menu,menuone,noselect'

-- Colors
vim.opt.syntax = 'enable'
vim.cmd([[ colorscheme tempus_night ]])

-- Tab and indent related
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


