require("nvim-tree").setup({
    diagnostics = {
        enable = true
    }
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
