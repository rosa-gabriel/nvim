return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        { 'nvim-lua/plenary.nvim' }
    },
    opts = {
        defaults = {
            style = "borderless",
            vimgrep_arguments = {
                "rg",
                "-L",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.80,
                height = 0.90,
                preview_cutoff = 120,
            },
            color_devicons = true,
        },
        extensions_list = { "themes", "terms", "fzf" },
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
