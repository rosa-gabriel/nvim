local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "luasnip" },
	}),
})

local capabilities = cmp_lsp.default_capabilities()

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, silent = true }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
end

vim.lsp.config("*", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("gopls", {
    cmd = { "gopls"},
    filetypes = { 'go' },
})

vim.lsp.config("jdtls", {
    cmd = { "jdtls"},
    filetypes = { 'java' },
})

vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer"},
    filetypes = { 'rs' },
})

vim.lsp.config("jsonls", {
    cmd = { "jsonls"},
    filetypes = { 'json' },
})

vim.lsp.config("ruff", {
    cmd = { "ruff"},
    filetypes = { 'py' },
})

vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server"},
    filetypes = { 'ts' },
})

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server"},
    filetypes = { 'lua' },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})
