return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'VonHeikemen/lsp-zero.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local lsp = require("lsp-zero")
            local cmp = require('cmp')
            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    lsp.default_setup,
                },
            })

            lsp.preset("recommended")
            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            })
            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
            end)
            lsp.setup()

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Goes to next option on LSP
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Goes to next option on LSP
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Goes to confirms option in LSP
                ['<C-Space>'] = cmp.mapping.complete(),
            })
            cmp.setup({
                mapping = cmp_mappings
            })
        end
    },
}
