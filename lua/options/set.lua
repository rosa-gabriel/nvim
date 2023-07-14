-- Used to make the cursor a box
vim.opt.guicursor = ""

-- Objetos de opcoes de config do NeoVim
local opt = vim.opt

-- Configuracao dos numeros laterais
opt.nu = true -- Mostra os numeros laterais
opt.relativenumber = true -- Mostra os numeros relativos a linha atual

-- Identacao e tab
opt.tabstop = 4 -- 4 Espacos para o tab
opt.softtabstop = 4 -- 4 Espacos para o tab
opt.shiftwidth = 4 -- 4 Espacos para a identacao
opt.expandtab = true

-- Indentation
opt.smartindent = true

opt.ignorecase = true

-- Quebra de linhas
opt.wrap = false -- Desativa a quebra de linhas

opt.swapfile = false
opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true;

-- Perquisa
opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

-- Cursor
opt.cursorline = true -- Faz um highlight da linha atual

-- Divitir a janela
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Configs em .vim
vim.cmd 'set mouse=' --Desativa o mouse
