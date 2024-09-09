return {
    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
    { 'lewis6991/gitsigns.nvim' },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
        config = true
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
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
