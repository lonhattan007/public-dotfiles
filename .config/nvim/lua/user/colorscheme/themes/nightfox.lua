-----------------------------------------------------------------------
-- NeoVim config module for Nightfox colorscheme
-----------------------------------------------------------------------

return {
    "edeneast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
        options = {
            transparent = vim.g.transparent_enabled or false,
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
    },
}
