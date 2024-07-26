return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = (function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.ui.calendar"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/neorg/notes",
                            weg = "~/neorg/weg",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        }
    end)
}
