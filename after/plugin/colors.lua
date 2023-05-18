require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true,
    term_colors = true,
    no_italic = true,
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

ColorMyPencils("dark", true, "catppuccin");
