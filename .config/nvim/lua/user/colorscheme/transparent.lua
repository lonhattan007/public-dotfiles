-----------------------------------------------------------------------
-- NeoVim config module for editor's transparency
-----------------------------------------------------------------------

local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
    return
end

transparent.setup({
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
})
