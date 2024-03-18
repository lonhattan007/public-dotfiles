-----------------------------------------------------------------------
-- NeoVim config module for illuminating word instances
-----------------------------------------------------------------------

return {
    "rrethy/vim-illuminate",
    config = function()
        -- The setup function name is `configure` instead of `setup`
        -- so we have to it do this way instead of defining `opts`
        require("illuminate").configure({
            providers = { "lsp", "treesitter", "regex" },
            delay = 100,
            filetypes_denylist = {
                "aerial",
                "flutterToolsOutline",
                "dapui_breakpoints",
                "dapui_console",
                "dapui_repl",
                "dapui_scopes",
                "dapui_stacks",
                "dapui_watches",
                "lazy",
                "netrw",
                "NvimTree",
                "mason",
                "qf",
                "undotree",
            },
        })
    end,
}
