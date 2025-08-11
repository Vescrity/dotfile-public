-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({})
lspconfig.pylsp.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                --version = "LuaJIT",
                version = "Lua 5.4",
            },
            diagnostics = {
                --globals = { "vim" },
            },
            workspace = {
                --library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.pumheight = 6
vim.opt.pumwidth = 26
vim.opt.spell = false
