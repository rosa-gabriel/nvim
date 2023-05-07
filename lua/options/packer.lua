vim.cmd [[packadd packer.nvim]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Base packer

	-- UI
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	}
	use 'nvim-tree/nvim-web-devicons' -- icons

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Unless you are still migrating, remove the deprecated commands from v1.x

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

	-- Dap
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use "theHamsta/nvim-dap-virtual-text"

	use 'mfussenegger/nvim-jdtls'

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	} -- Autocompletion for pairs "()"
	use {'windwp/nvim-ts-autotag'} -- autoclose html tags

end);

