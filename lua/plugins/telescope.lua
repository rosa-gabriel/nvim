return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = (function()
        local telescope_builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>vh', telescope_builtin.help_tags, {})
        vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, {})
        vim.keymap.set('n', '<leader>po', telescope_builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>pu', telescope_builtin.resume, {})
        vim.keymap.set('n', '<C-p>', telescope_builtin.git_files, {})
        vim.keymap.set('n', '<leader>gc', telescope_builtin.git_commits, {})
        vim.keymap.set('n', '<leader>gb', telescope_builtin.git_branches, {})
        vim.keymap.set('n', '<leader>pg', telescope_builtin.live_grep, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>ps', telescope_builtin.grep_string, {})
    end)

}
