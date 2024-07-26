return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            { "<leader>gs", vim.cmd.Git }
        }
    },                             -- Git support
    { 'lewis6991/gitsigns.nvim' }, -- Git Annotations
}
