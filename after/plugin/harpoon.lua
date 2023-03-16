local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file) -- Adds a buffer to the harpoon buffer
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu) -- Shows the harpoon buffer 

vim.keymap.set("n", "<C-h>", function()ui.nav_file(1)end) -- Goes to file at index(1) in harpoon buffer
vim.keymap.set("n", "<C-t>", function()ui.nav_file(2)end) -- Goes to file at index(2) in harpoon buffer
vim.keymap.set("n", "<C-n>", function()ui.nav_file(3)end) -- Goes to file at index(3) in harpoon buffer
vim.keymap.set("n", "<C-s>", function()ui.nav_file(4)end) -- Goes to file at index(4) in harpoon buffer
