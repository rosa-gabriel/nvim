vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Base packer

	-- UI
	use('feline-nvim/feline.nvim') -- Bottom status bar
	use { "ellisonleao/gruvbox.nvim" } -- Theme
	use 'nvim-tree/nvim-web-devicons' -- icons

	-- Navigation
	use("ThePrimeagen/harpoon"); -- File navigation with marks
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	} -- Quick open
	use {'BurntSushi/ripgrep'} -- used for search

	-- Source controll
	use("mbbill/undotree"); -- Shows all modifications
	use("tpope/vim-fugitive"); -- Git support
	use {'lewis6991/gitsigns.nvim'} -- Git Annotations

	-- Base features
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}); -- Theme support etc - nvim-treesitter
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'}, 
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	} -- Lsp support (Autocompletion)
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	} -- Autocompletion for pairs "()"
	use {'windwp/nvim-ts-autotag'} -- autoclose html tags
end);
