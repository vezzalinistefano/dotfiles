local keymap_set = vim.keymap.set
vim.g.mapleader = " "
keymap_set("n", "<leader>pv", vim.cmd.Ex)

keymap_set("v", "J",          ":m '>+1<CR>gv=gv")
keymap_set("v", "K",          ":m '<-2<CR>gv=gv")

keymap_set("n", "J",          "mzJ`z")
keymap_set("n", "<C-d>",      "<C-d>zz")
keymap_set("n", "<C-u>",      "<C-u>zz")
keymap_set("n", "n",          "nzzzv")
keymap_set("n", "N",          "Nzzzv")

-- greatest remap ever
keymap_set("x", "<leader>p",  "\"_dP")

-- next greatest remap ever : asbjornHaland
keymap_set("n", "<leader>y",  "\"+y")
keymap_set("v", "<leader>y",  "\"+y")

keymap_set("n", "<leader>Y",  "\"+Y")

keymap_set("n", "<leader>d",  "\"_d")
keymap_set("v", "<leader>d",  "\"_d")

-- This is going to get me cancelled
keymap_set("i", "<C-c>",      "<Esc>")
keymap_set("i", "jj",         "<Esc>")
keymap_set("n", "Q",          "<nop>")

keymap_set("n", "<leader>f",  function() vim.lsp.buf.format() end)

keymap_set("n", "<C-k>",      "<cmd>cnext<CR>zz")
keymap_set("n", "<C-j>",      "<cmd>cprev<CR>zz")
keymap_set("n", "<leader>k",  "<cmd>lnext<CR>zz")
keymap_set("n", "<leader>j",  "<cmd>lprev<CR>zz")

keymap_set("n", "<leader>s",  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
keymap_set("n", "<leader>x",  "<cmd>!chmod +x %<CR>", { silent = true })
