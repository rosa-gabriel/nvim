return {
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
        config = true
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        lazy = false,
        config = true
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = true,
        keys = {
            { "<leader>pt", ":TodoTelescope<CR>" }
        }
    },
}
