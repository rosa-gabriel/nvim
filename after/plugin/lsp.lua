local lsp = require("lsp-zero")

-- TODO: null-ls will be archived - find a new option
-- On null-ls you can import parts of the service / like in eslint you can import just the diagnostics or/and the code actions
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
    },
})

local system = "windows";
local enable_dart = false;

lsp.preset("recommended") -- Chooses the default settings for LSP

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'lua_ls',
        'jdtls',
        'jsonls'
    },
    handlers = {
        lsp.default_setup,
    },
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})                                                              -- Fix Undefined global 'vim'

vim.keymap.set("n", "<leader>lr", ":w<CR>:LspRestart<CR>", {}); -- Lsp reload

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), -- Goes to next option on LSP
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select), -- Goes to next option on LSP
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),   -- Goes to confirms option in LSP
    ["<C-Space>"] = cmp.mapping.complete(),               -- Calls LSP
})

cmp.setup({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
}) -- The letters that appear in the side of the line when there is a information to be displayed

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({ timeout_ms = 10000 }) end, opts)
end)

if system == "windows" then
    local user = 'gabri'
    local workspace_dir = 'G:/src/java/'
    local jdtls_path = 'C:/Users/' .. user .. '/AppData/Local/nvim-data/mason/share/jdtls'
    local path_to_lsp_server = "C:/Users/" .. user .. "/AppData/Local/nvim-data/mason/packages/jdtls/config_win"
    local path_to_plugins = jdtls_path .. "/plugins/"
    local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"

    local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = require("jdtls.setup").find_root(root_markers);

    local java_root_finder = (function()
        return root_dir;
    end)

    lsp.configure('jdtls',
        {
            cmd = {
                'java',
                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-Xms1g',
                '--add-modules=ALL-SYSTEM',
                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

                '-jar', path_to_jar,
                '-configuration', path_to_lsp_server,
                '-data', workspace_dir,
            },
            root_dir = java_root_finder,
        }
    )
else
end

lsp.configure('omnisharp', {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    }
})

if enable_dart then
    lsp.configure('dartls', {
        settings = {
            dart = {
                analysisExcludedFolders = {
                    vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
                    vim.fn.expand("$HOME/.pub-cache"),
                    vim.fn.expand("/opt/homebrew/"),
                    vim.fn.expand("$HOME/tools/flutter/"),
                },
                updateImportsOnRename = true,
                completeFunctionCalls = true,
                showTodos = true,
            },
        },
    })
end

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Dap

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:'))<CR>")

require("nvim-dap-virtual-text").setup();
require("dapui").setup();

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

local mason_registry = require("mason-registry")
local js_path = (mason_registry.get_package("js-debug-adapter")):get_install_path();

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = { js_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
    }

}

dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    },
}
