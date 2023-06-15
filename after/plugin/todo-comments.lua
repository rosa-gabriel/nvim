require("todo-comments").setup()

-- To use you need to put one of the default kewords followed by :
vim.keymap.set('n' , '<leader>pt', ":TodoTelescope<CR>", {})
