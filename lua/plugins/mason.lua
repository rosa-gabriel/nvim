return {
	"williamboman/mason.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"mfussenegger/nvim-jdtls",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("fidget").setup({})
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "jdtls", "gopls", "rust_analyzer", "jsonls", "ruff", "stylua", "ts_ls" },
			automatic_installation = true,
		})
	end,
}
