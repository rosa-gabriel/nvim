return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
            formatters = {
                ["google-java-format"] = {
                    prepend_args = { "--aosp" },
                },
            },
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				rust = { "rustfmt" },
                xml = { "xmlformatter" },
				java = { "google-java-format" },
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
