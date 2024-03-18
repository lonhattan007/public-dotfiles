-----------------------------------------------------------------------
-- NeoVim config module for editor's transparency
-----------------------------------------------------------------------

return {
    "xiyaowong/nvim-transparent",
    opts = {
        extra_groups = {
            "BufferLineTabClose",
            "BufferlineBufferSelected",
            "BufferLineFill",
            "BufferLineBackground",
            "BufferLineSeparator",
            "BufferLineIndicatorSelected",
            "FloatBorder",
            "NormalFloat",
            "GitSignsAddNr",
            "GitSignsChangeNr",
            "GitSignsDeleteNr",
            "GitSignsChangedeleteNr",
            "GitSignsTopdeleteNr",
            "GitSignsUntrackedNr",
        },
        exclude_groups = {},
    },
}
