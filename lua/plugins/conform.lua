return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				json = { "fixjson" },
                rust = { "rustfmt", lsp_format = "fallback" },
                java = { "google-java-format" },
                python = { "ruff_format" }
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
