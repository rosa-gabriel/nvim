require("everforest").setup({
  background = "medium",
  transparent_background_level = 0,
  italics = false,
  disable_italic_comments = false,
})

function ColorMyPencils(theme, transparent, color)
	color = color or "catppuccin";
	vim.o.background = theme;
	vim.cmd.colorscheme(color);

	if transparent then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

ColorMyPencils("dark", false, "everforest");
