return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
    config = (function()
        local neorg = require('neorg')

        neorg.setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/neorg/notes",
                            weg = "~/neorg/weg",
                            college = "~/neorg/college",
                        },
                        default_workspace = "notes",
                    },
                },
                ["core.integrations.telescope"] = {},
                ["core.export"] = {},
            },
        }

        vim.keymap.set("n", "<localleader>p", "<Plug>(neorg.telescope.find_norg_files)")
        vim.keymap.set("n", "<localleader>w", "<Plug>(neorg.telescope.switch_workspace)")
        vim.keymap.set("n", "<localleader>h", "<Plug>(neorg.telescope.search_headings)")
        vim.keymap.set("n", "<localleader>l", "<Plug>(neorg.telescope.insert_file_link)")
        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end)
}
