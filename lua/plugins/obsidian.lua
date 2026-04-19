return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	config = function()
		require("fidget").setup({})
		require("mason").setup()

		require("obsidian").setup({
			legacy_commands = false, -- this will be removed in the next major release
			note_id_func = require("obsidian.builtin").title_id,
			-- note_id_func = require("obsidian.builtin").zettel_id,
			notes_subdir = "zettels",
			daily_notes = {
				folder = "daily-notes",
			},
			statusline = {
				enabled = false,
			},
			footer = {
				enabled = false,
			},
			workspaces = {
				{
					name = "personal",
					path = "~/vaults/personal",
				},
				{
					name = "weg",
					path = "~/vaults/weg",
				},
			},
		})
	end,
	keys = {
		{ "<leader>ow", ":Obsidian workspace<CR>" },

		{ "<leader>odt", ":Obsidian today<CR>" },
		{ "<leader>ods", ":Obsidian dailies<CR>" },

		{ "<leader>ons", ":Obsidian search<CR>" },
		{ "<leader>ont", ":Obsidian tags<CR>" },
		{ "<leader>onb", ":Obsidian backlinks<CR>" },
		{ "<leader>oni", ":Obsidian new<CR>" },
		{ "<leader>onr", ":Obsidian rename<CR>" },

		{ "<leader>ov", ":Obsidian follow_link vsplit<CR>" },
		{ "<leader>oc", ":Obsidian toc<CR>" },
		{ "<leader>oi ", ":Obsidian paste_img<CR>" },
		{ "<leader>ot", ":Obsidian template<CR>" },
	},
}
