vim.g.mapleader = " "; -- Set the <leader> in the remaps

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --Open vim file explorer

-- Makes copy to clipboard on <leader>y
--vim.keymap.set("n", "<leader>y", "\"+y");
--vim.keymap.set("v", "<leader>y", "\"+y");
--vim.keymap.set("n", "<leader>Y", "\"+Y");

vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste without yanking 

vim.keymap.set("i", "<C-H>", "<C-w>") -- Windows bind 
--vim.keymap.set("i", "<C-BS>", "<C-w>") -- wsl <Cntrl-BackSpace> bind
