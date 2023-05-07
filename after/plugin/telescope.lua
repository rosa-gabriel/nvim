local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles , {})
vim.keymap.set('n', '<leader>pu', builtin.resume , {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

vim.keymap.set('n', '<leader>pg', builtin.live_grep , {})
vim.keymap.set({'n', 'v'} , '<leader>ps', builtin.grep_string, {})
