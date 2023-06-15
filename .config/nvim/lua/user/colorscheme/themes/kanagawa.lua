-----------------------------------------------------------------------
-- NeoVim config module for Nightfox colorscheme
-----------------------------------------------------------------------

local kanagawa_status_ok, kanagawa = pcall(require, "kanagawa")
if not kanagawa_status_ok then
    return
end

kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { italic = true },
    keywordStyle = {},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = vim.g.transparent_enabled,
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {},
    theme = {
        dark = "dragon",
        light = "lotus",
        default = "wave",
        all = {
            ui = {
                float = {
                    bg = "none",
                },
            },
        },
    },
    overrides = function(colors) -- for transparent floating windows
        local theme = colors.theme
        return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = "none" },
            MasonNormal = { bg = "none", fg = theme.ui.fg_dim },
            TelescopeNormal = { bg = "none" },
            TelescopeBorder = {
                bg = "none",
                fg = theme.ui.fg_dim,
            },
        }
    end,
})
