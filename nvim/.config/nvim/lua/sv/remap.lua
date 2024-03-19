local map = vim.keymap.set
vim.g.mapleader = " "

-- NetRw
map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

map("n", "<leader>Y", "\"+Y")

map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

map("i", "<C-c>", "<Esc>")
map("i", "jj", "<Esc>")
map("n", "Q", "<nop>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
