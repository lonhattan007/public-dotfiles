-----------------------------------------------------------------------
-- NeoVim config module for Catppuccin colorscheme
-----------------------------------------------------------------------

local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
    return
end

catppuccin.setup({
    flavour = "frappe", -- latte, frappe, macchiate, mocha
    background = {
        -- h: background
        light = "latte",
        dark = "frappe",
    },
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.12,
    },
    term_colors = false,
    transparent_background = vim.g.transparent_enabled,
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
})
