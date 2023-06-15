-----------------------------------------------------------------------
-- NeoVim config module for LSP configs
-----------------------------------------------------------------------

local config_status_ok, lspconfig = pcall(require, "lspconfig")
if not config_status_ok then
    return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
    return
end

-- LspInfo window border
require("lspconfig.ui.windows").default_options.border = "single"

-- Handler configs
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false, --[[ {
		prefix = "●",
		spacing = 4,
	}, ]]
        signs = true,
        severity_sort = true,
        border = "rounded",
    })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local lsp_options = require("user.lsp.lsp_options")
local language_servers = lsp_options.language_servers
local on_attach = lsp_options.on_attach
local capabilities = lsp_options.capabilities

-- Pcakages management
mason_lsp.setup({
    ensure_installed = language_servers,
    automatic_installation = true,
})

-- Dynamic servers config
mason_lsp.setup_handlers({
    -- Default handler
    function(server)
        lspconfig[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            completion = {
                callSnippet = "Replace",
            },
        })
    end,
    -- Custom handler for each server
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                },
            },
        })
    end,
})
