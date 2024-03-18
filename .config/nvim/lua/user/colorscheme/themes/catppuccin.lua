-----------------------------------------------------------------------
-- NeoVim config module for Catppuccin colorscheme
-----------------------------------------------------------------------

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
        flavour = "mocha", -- latte, frappe, macchiate, mocha
        background = {
            -- h: background
            light = "latte",
            dark = "mocha",
        },
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.12,
        },
        term_colors = false,
        transparent_background = vim.g.transparent_enabled or false,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = { "italic" },
            keywords = {},
            strings = {},
            variables = { "italic" },
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            telescope = true,
            ts_rainbow = true,
            aerial = true,
            nvimtree = true,
        },
    },
}
