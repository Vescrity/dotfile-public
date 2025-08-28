return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = false,
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.4", }
                    }
                }
            }
        },
    },
}
