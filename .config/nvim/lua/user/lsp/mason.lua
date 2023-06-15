-----------------------------------------------------------------------
-- NeoVim config module for LSPs, DAPs, linters and formatters installer
-----------------------------------------------------------------------

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    return
end

local lsp_options = require("user.lsp.lsp_options")

mason.setup({
    ui = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
        max_concurrent_installers = 4,
    },
})
