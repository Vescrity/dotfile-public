return {
    {
        "folke/tokyonight.nvim", -- 或其他 colorscheme
        opts = {
            on_colors = function(colors)
                colors.DiagnosticUnnecessary = "#887777"
                colors.bg = "NONE"
                colors.bg_dark = "#000000"
            end,
            on_highlights = function(hl, colors)
                hl.DiagnosticUnnecessary = {
                    fg = colors.DiagnosticUnnecessary,
                    italic = true
                }
            end,
        },
    },
}
