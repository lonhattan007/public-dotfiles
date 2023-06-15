-----------------------------------------------------------------------
-- NeoVim config module for Nightfox colorscheme
-----------------------------------------------------------------------

local nightfox_status_ok, nightfox = pcall(require, "nightfox")
if not nightfox_status_ok then
    return
end

nightfox.setup({
    options = {
        transparent = vim.g.transparent_enabled,
        terminal_colors = false,
        dim_inactive = true,
        styles = {
            -- Value is any valid attr-list value `:help attr-list`
            comments = "italic",
            conditionals = "italic",
            constants = "NONE",
            functions = "italic",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "italic",
        },
        -- Inverse highlight for different types
        inverse = {
            match_paren = false,
            visual = false,
            search = false,
        },
        -- List of various plugins and additional options
        modules = {
            telescope = true,
            tsrainbow = true,
            aerial = true,
        },
    },
})
