-- Defaults
local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }
noremap_options = { noremap = true, silent = true }

-- Remap space as leader key
map({ 'n', 'v' }, '<Space>', '<NOP>', noremap_options) 
vim.g.mapleader = ' '

-- File explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', noremap_options)

-- Double j exit inser mode
map('i', 'jj', '<ESC>', noremap_options)

-- Easier window movement
map('n', '<C-h>', '<C-w>h', default_options)
map('n', '<C-j>', '<C-w>j', default_options)
map('n', '<C-k>', '<C-w>k', default_options)
map('n', '<C-l>', '<C-w>l', default_options)

-- Better indenting
map('v', '<', '<gv', noremap_options)
map('v', '>', '>gv', noremap_options)

-- Tab switch buffer
map('n', '<TAB>', ':bnext<CR>', noremap_options)
map('n', '<S-TAB>', ':bprevious<CR>', noremap_options)

-- Vim fugitive keymappings
map('n', '<Leader>gg', ':G<CR>', noremap_options)

-- Cancel search highlighting with ESC
map('n', '<ESC>', ":nohlsearch<Bar>:echo<CR>", default_options)

-- Telescope key mappings
map('n', '<Leader>ff', ':Telescope find_files<CR>', noremap_options)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', noremap_options)
map('n', '<Leader>fb', ':Telescope buffers<CR>', noremap_options)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', noremap_options)
