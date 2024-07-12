local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "; -- Set the <leader> in the remaps
vim.g.maplocalleader = ",";

require('lazy').setup({
    "ThePrimeagen/vim-be-good",

    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_enable_italic = true
            vim.g.background = "hard"
        end
    },
    -- lazy.nvim
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    },

    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        config = (function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/neorg/notes",
                                weg = "~/neorg/weg",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            }
        end)
    },

    -- UI
    "stevearc/oil.nvim",
    'nvim-tree/nvim-web-devicons', -- icons

    'nvimtools/none-ls.nvim',
    'nvimtools/none-ls-extras.nvim',

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Navigation
    "ThePrimeagen/harpoon", -- File navigation with marks

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
    },                    -- Quick open
    'BurntSushi/ripgrep', -- used for search

    -- Source controll
    "mbbill/undotree",             -- Shows all modifications
    "tpope/vim-fugitive",          -- Git support
    { 'lewis6991/gitsigns.nvim' }, -- Git Annotations

    -- Base features
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    }, -- Theme support etc - nvim-treesitter

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }, -- Lsp support (Autocompletion)

    -- LSP Extenders
    'mfussenegger/nvim-jdtls',           -- Extender for Java
    "Hoffs/omnisharp-extended-lsp.nvim", -- Extender for C#

    -- Dap
    -- 'mfussenegger/nvim-dap',
    -- 'rcarriga/nvim-dap-ui',
    -- "theHamsta/nvim-dap-virtual-text",

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },                            -- Autocompletion for pairs "()"

    { 'windwp/nvim-ts-autotag' }, -- autoclose html tags
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
});
