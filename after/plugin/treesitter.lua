require 'nvim-treesitter.install'.compilers = { "clang" }
--require 'nvim-treesitter.install'.compilers = { "gcc" }

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
	  "help", 
	  "javascript", 
	  "typescript", 
	  "vim", 
	  "java", 
	  "lua", 
	  "cpp", 
	  "sql",
	  "python",
	  "markdown"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
   additional_vim_regex_highlighting = false,
  },
}

-- All the default lenguages:

--  ensure_installed = { 
--	  "help", 
--	  "javascript", 
--	  "typescript", 
--	  "vim", 
--	  "java", 
--	  "lua", 
--	  "cpp", 
--	  "sql",
--	  "python",
--	  "markdown"
--  },
--
--
