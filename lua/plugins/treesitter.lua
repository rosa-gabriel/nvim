return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = (function()
        require 'nvim-treesitter.install'.compilers = { "clang" }
        require 'nvim-treesitter.configs'.setup {
            sync_install = false,
            auto_install = true,
            ignore_install = { 'org' },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end)
}
