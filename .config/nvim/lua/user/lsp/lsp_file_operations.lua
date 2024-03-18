-----------------------------------------------------------------------
-- NeoVim config module for LSP file operations
-----------------------------------------------------------------------

return {
    {
        "antosha417/nvim-lsp-file-operations",
        events = { "BufEnter", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = true,
    },
}
