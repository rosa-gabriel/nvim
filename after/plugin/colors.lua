require('rose-pine').setup({
    variant = 'moon',
    disable_italics = true,
})

function ColorMyPencils(theme, transparent, color)
    color = color or "rose-pine";
    vim.o.background = theme;
    vim.cmd.colorscheme(color);

    if transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

ColorMyPencils("dark", false, "rose-pine");
