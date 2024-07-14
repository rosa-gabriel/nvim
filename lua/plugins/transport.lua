return {
    {
        "stevearc/oil.nvim",
        opts = {
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            use_default_keymaps = false,
            view_options = {
                show_hidden = true,
            },
        },
        keys = {
            { "<leader>pv", ":Oil<CR>" },
        }
    },
    {
        "ThePrimeagen/harpoon",
        config = (function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)             -- Adds a buffer to the harpoon buffer
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)          -- Shows the harpoon buffer

            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end) -- Goes to file at index(1) in harpoon buffer
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end) -- Goes to file at index(2) in harpoon buffer
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end) -- Goes to file at index(3) in harpoon buffer
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end) -- Goes to file at index(4) in harpoon buffer
        end)
    },                                                                  -- File navigation with marks
    {
        'nvim-telescope/telescope.nvim',
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
    },
}
