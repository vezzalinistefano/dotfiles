local utils      = require "sv.utils"
local o          = vim.opt

o.guicursor      = ""

o.nu             = true
o.relativenumber = true

o.tabstop        = 4
o.softtabstop    = 4
o.shiftwidth     = 4
o.expandtab      = true

o.smartindent    = true

o.wrap           = false

o.swapfile       = false
o.backup         = false
o.undodir        = os.getenv("HOME") .. "/.vim/undodir"
o.undofile       = true

o.hlsearch       = false
o.incsearch      = true

o.termguicolors  = true
o.splitright     = true

o.scrolloff      = 8
o.signcolumn     = "yes"

o.updatetime     = 50

o.colorcolumn    = "80"

vim.g.mapleader  = " "

o.termguicolors  = true
o.cursorline     = true

o.autoread       = true

o.isfname:append("@-@")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25;

vim.filetype.add ({
    pattern = {
        ['.*.yaml.tftpl'] = 'yaml'
    }
})

-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHoldI", "CursorHold" }, {
--     group = StefanoVezzaliniGroup,
--     command = "if mode() != 'c' | checktime | endif",
--     pattern = { "*" }
-- })

-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--     group = StefanoVezzaliniGroup,
--     command = "if mode() != 'c' | checktime | endif",
--     pattern = { "*.tftpl" }
-- })
