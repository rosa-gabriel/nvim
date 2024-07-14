return {
    'nvim-tree/nvim-web-devicons',
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        {
            "folke/trouble.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
        },
    },
}
