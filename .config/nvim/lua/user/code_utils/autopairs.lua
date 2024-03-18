-----------------------------------------------------------------------
-- NeoVim config module for auto close brackets
-----------------------------------------------------------------------

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
}
