-----------------------------------------------------------------------
-- NeoVim config module for LSP config options
-----------------------------------------------------------------------

local M = {}

M.language_servers = {
    -- My fav --------------------------
    -- "pylsp",
    -- "gopls",
    -- Included in flutter-tools
    -- "dartls",
    -- Documentation, operation, config
    -- "jsonls",
    -- "yamlls",
    -- "dockerls",
    -- "docker_compose_language_service",
    -- "bashls",
    -- "marksman",
    -- "texlab",
    -- "taplo",
    -- "terraformls",
    -- Basic front end stuff -----------
    -- "html",
    -- "emmet_ls",
    -- "cssls",
    -- Advanced front end stuff --------
    -- "svelte",
    -- "vuels",
    -- "tailwindcss",
    -- "tsserver",
    -- Android stuff -------------------
    -- "kotlin_language_server",
    -- "jdtls",
    -- "groovyls",
    -- Back end stuff ------------------
    -- "prismals",
    -- "graphql",
    -- "sqlls",
    -- Other stuff ---------------------
    "lua_ls",
    -- "rust_analyzer",
    -- "clangd",
}

M.on_attach = function(client, bufnr)
    local wk = require("which-key")
    local bufopts =
        { mode = "n", noremap = true, silent = true, buffer = bufnr }

    wk.register({
        ["<leader>gd"] = { vim.lsp.buf.definition, "Go to definition" },
        ["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Go to definition" },
        ["<leader>gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
        ["gi"] = {
            "<cmd>Telescope lsp_implementations<CR>",
            "Go to implementation",
        },
        ["gr"] = { "<cmd>Telescope lsp_references<CR>", "Go to references" },
        ["gs"] = { vim.lsp.buf.signature_help, "Signature help" },
        ["K"] = { vim.lsp.buf.hover, "Hover documentation" },
        ["<leader>a"] = { vim.lsp.buf.code_action, "Code actions" },
        ["[d"] = {
            "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",
            "Go to previous diagnostic problem",
        },
        ["]d"] = {
            "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
            "Go to next diagnostic problem",
        },
    }, bufopts)

    wk.register({
        ["<F2>"] = { "<cmd>lua require('renamer').rename()<CR>", "Rename" },
        ["<leader>r"] = { "<cmd>lua require('renamer').rename()<CR>", "Rename" },
    }, {
        mode = { "n", "v" },
        silent = true,
        noremap = true,
        buffer = bufnr,
    })

    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end,
        })

        wk.register({
            ["<leader>i"] = { vim.lsp.buf.format, "Reformat code" },
        }, bufopts)
    end
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

return M
