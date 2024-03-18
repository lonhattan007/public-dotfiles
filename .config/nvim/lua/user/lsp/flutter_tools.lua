-----------------------------------------------------------------------
-- NeoVim config module for Flutter's specific configs
-----------------------------------------------------------------------

return {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
        local sys_flutter_path = ""
        local path_sep = package.config:sub(1, 1)

        if path_sep == "/" then
            -- unix path separator
            -- equivalent of "$HOME/Development/..."
            sys_flutter_path = vim.fn.stdpath("config")
                .. "/../../.local/bin/flutter/bin/flutter"
        elseif path_sep == "\\" then
            -- windows path separator
            -- equivalent of "$HOME/Development/..."
            sys_flutter_path = vim.fn.stdpath("config")
                .. "\\..\\..\\..\\Development\\flutter\\bin\\flutter.bat"
        end

        local lsp_options = require("user.lsp.config.lsp_options")

        require("flutter-tools").setup({
            ui = {
                border = "rounded",
                notification_style = "native",
            },
            decorations = {
                statusline = {
                    app_version = false,
                    device = true,
                },
            },
            flutter_path = sys_flutter_path,
            widget_guides = {
                enabled = true,
            },
            lsp = {
                on_attach = lsp_options.on_attach,
                capabilities = lsp_options.capabilities,
            },
        })
    end,
}
