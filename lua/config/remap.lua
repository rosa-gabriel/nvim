vim.keymap.set({ "n", "i", "c" }, "<C-c>", "<esc>")
-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y");
vim.keymap.set({ "n", "v" }, "<leader>Y", "\"+Y");
vim.keymap.set({ "n", "v" }, "<leader>pc", "\"+p");
vim.keymap.set("x", "<leader>p", [["_dP]])


-- Fixed word backspace
vim.keymap.set({ "i", "c" }, "<C-H>", "<C-w>")
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-w>")

-- Center when going up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
