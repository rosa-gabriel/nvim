-- Objetos de opcoes de config do NeoVim
local opt = vim.opt
local g = vim.g

-- Desativa netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Configuracao dos numeros laterais
opt.number = true -- Mostra os numeros laterais
opt.relativenumber = true -- Mostra os numeros relativos a linha atual

-- Identacao e tab
opt.tabstop = 4 -- 4 Espacos para o tab
opt.softtabstop = 4 -- 4 Espacos para o tab
opt.shiftwidth = 4 -- 4 Espacos para a identacao
opt.autoindent = true -- Faz a identacao da proxima linha para ser igual a da linha atual

-- Quebra de linhas
opt.wrap = false -- Desativa a quebra de linhas

-- Perquisa
opt.hlsearch = false
opt.incsearch = true
opt.scrolloff = 8
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "150"

-- Cursor
opt.cursorline = true -- Faz um highlight da linha atual

-- Aparencia
opt.termguicolors = true
opt.background = "dark" -- Escolhe a versao dark dos temas selecionados
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Copiar
opt.clipboard:append("unnamedplus") -- Usa as copias padroes do sistema

-- Divitir a janela
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- considera a-a como uma palavra

-- Configs em .vim
vim.cmd 'set noshowmode'
vim.cmd 'set mouse='
