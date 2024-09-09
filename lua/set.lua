-- GUI
vim.opt.guicursor = ""        -- Cursor
vim.opt.nu = true             -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false          -- Desativa a quebra de linhas
vim.opt.termguicolors = true
vim.opt.cursorline = true     -- Faz um highlight da linha atual
-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- Search
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Quality of life
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom
vim.cmd 'set mouse='      -- Disable mouse
vim.g.mapleader = " ";    -- Set the <leader> in the remaps
vim.g.maplocalleader = ",";
vim.diagnostic.config({
    virtual_text = true
})
