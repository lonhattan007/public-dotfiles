-----------------------------------------------------------------------
-- NeoVim config module for Github colorscheme
-----------------------------------------------------------------------

return {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("github-theme").setup({
            options = {

                transparent = vim.g.transparent_enabled or false,
                terminal_colors = false,
                dim_inactive = false,
                styles = {
                    comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                    functions = "italic",
                    keywords = "NONE",
                    variables = "italic",
                    conditionals = "italic",
                    constants = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                },
            },
        })
    end,
}
