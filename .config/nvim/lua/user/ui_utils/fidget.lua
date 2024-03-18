-----------------------------------------------------------------------
-- NeoVim config module for LSP fidget icon
-----------------------------------------------------------------------

return {
    "j-hui/fidget.nvim",
    opts = {
        notification = {
            window = {
                winblend = 0,
                border = "rounded",
            },
        },
    },
}
