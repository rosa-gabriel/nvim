return {
    {
        'nvimtools/none-ls.nvim',
        config = (function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    require('none-ls.formatting.eslint_d'),
                    require('none-ls.diagnostics.eslint_d'),
                },
            })
        end)
    },
    'nvimtools/none-ls-extras.nvim',
    "Hoffs/omnisharp-extended-lsp.nvim", -- C#
}
