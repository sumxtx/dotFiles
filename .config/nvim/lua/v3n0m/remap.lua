vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("i","jj", "<Esc>")

vim.keymap.set("n","<leader>n", "<C-w>")

vim.keymap.set("n","<leader>k", "<cmd> tabnew .<CR>")
vim.keymap.set("n","<leader>l", vim.cmd.tabnext)
vim.keymap.set("n","<leader>h", vim.cmd.tabprevious)
vim.keymap.set("n","<leader>q", vim.cmd.tabclose)
vim.keymap.set("n","<leader>ñ", "<cmd>quit<CR>")
