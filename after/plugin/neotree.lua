require("nvim-tree").setup()

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Opens the source 

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
