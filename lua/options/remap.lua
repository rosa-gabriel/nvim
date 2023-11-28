vim.g.mapleader = " "; -- Set the <leader> in the remaps

-- Makes copy to clipboard on <leader>y
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y");
vim.keymap.set({"n", "v"}, "<leader>Y", "\"+Y");
vim.keymap.set({"n", "v"}, "<leader>pc", "\"+p");
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move up and down on edit mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({"n", "i", "c"}, "<C-c>", "<esc>") -- Cntrl-p is useless

vim.keymap.set({"i", "c"} , "<C-H>", "<C-w>") -- Windows bind 
vim.keymap.set({"i", "c"}, "<C-BS>", "<C-w>") -- wsl <Cntrl-BackSpace> bind

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- wsl <Cntrl-BackSpace> bind
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- wsl <Cntrl-BackSpace> bind
