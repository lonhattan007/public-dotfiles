-----------------------------------------------------------------------
-- NeoVim config module for surrounding codes with brackets or marks
-----------------------------------------------------------------------

return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
}
