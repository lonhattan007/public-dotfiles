-----------------------------------------------------------------------
-- NeoVim config module for LSP config options
-----------------------------------------------------------------------

local M = {}

M.language_servers = {
    -- My fav, usually used -------------------------------
    -- "efm",
    -- "pylsp",
    -- "lua_ls",
    -- "jsonls",
    -- "yamlls",
    -- "dockerls",
    -- "docker_compose_language_service",
    -- "bashls",
    -- "texlab",
    -- "html",
    -- "emmet_ls",
    -- "cssls",
    -- "tailwindcss",
    -- "ts_ls",
    -- "denols",
    -- "gopls",
    -- "dartls", -- Included in flutter-tools, don't touch
    -- Documentation, operation, config --------------------
    -- "marksman",
    -- "taplo",
    -- "terraformls",
    -- Front end stuff -------------------------------------
    -- "svelte",
    -- "vuels",
    -- Android stuff ---------------------------------------
    -- "kotlin_language_server",
    -- "jdtls",
    -- "groovyls",
    -- Back end stuff --------------------------------------
    -- "pyright", -- python but not as good as pylsp
    -- "omnisharp", -- dotnet
    -- "prismals",
    -- "graphql",
    -- "sqlls",
    -- Other stuff ----------------------------------------
    -- "rust_analyzer",
    -- "clangd",
}

local keymap = vim.keymap.set

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "efm" and client.name ~= "clangd"
            -- client.name ~= "tsserver"
            -- and client.name ~= "pyright"
            -- and client.name ~= "eslint"
            -- and client.name ~= "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local diagnostic_goto_prev = function()
    if vim.lsp.jump ~= nil then
        vim.diagnostic.jump({
            count = -1,
            float = true,
        })
    else
        vim.diagnostic.goto_prev()
    end
end

local diagnostic_goto_next = function()
    if vim.lsp.jump ~= nil then
        vim.diagnostic.jump({
            count = 1,
            float = true,
        })
    else
        vim.diagnostic.goto_prev()
    end
end

local lsp_hover = function()
    local nvim_version = vim.version()
    if (nvim_version.major == 0 and nvim_version.minor >= 11) then
        vim.lsp.buf.hover({
            border = 'rounded'
        })
    else
        vim.lsp.buf.hover()
    end
end

M.on_attach = function(client, bufnr)
    -- resolve get_clients API
    local active_clients

    if vim.lsp.get_clients ~= nil then
        active_clients = vim.lsp.get_clients()
    else
        active_clients = vim.lsp.get_active_clients()
    end

    -- resolve tsserver and denols conflicts
    if client.name == "denols" then
        for _, client_ in pairs(active_clients) do
            -- stop tsserver if denols is already active
            if client_.name == "ts_ls" then
                client_.stop()
            end
        end
    elseif client.name == "ts_ls" then
        for _, client_ in pairs(active_clients) do
            -- prevent tsserver from starting if denols is already active
            if client_.name == "denols" then
                client.stop()
            end
        end
    end

    -- setting up keymaps used by LSP
    local builtin = require("telescope.builtin")
    keymap("n", "gd", builtin.lsp_definitions, { desc = "[G]o to [D]efinition", buffer = bufnr })
    keymap("n", "gs", ":split<CR>gd", { desc = "[G]o to [D]efinition in [S]plit", buffer = bufnr, silent = true })
    keymap("n", "gv", ":vsplit<CR>gd", { desc = "[G]o to [D]efinition in [V]split", buffer = bufnr, silent = true })
    keymap("n", "gi", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation", buffer = bufnr })
    keymap("n", "gy", builtin.lsp_type_definitions, { desc = "[G]o to type definition", buffer = bufnr })
    -- keymap("n", "<leader>si" , builtin.lsp_implementations,{ desc =  "[S]earch [I]mplementation", buffer = bufnr })
    keymap("n", "gr", vim.lsp.buf.references, { desc = "[G]o to [R]eferences", buffer = bufnr })
    -- keymap("n", "<leader>sr", builtin.lsp_references, { desc = "[S]earch [R]eferences", buffer = bufnr })
    -- keymap("n", "<leader>ds", builtin.document_symbols, { desc = "[D]ocument [S]ymbols", buffer = bufnr })
    -- keymap("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace dynamic [S]ymbols", buffer = bufnr })
    keymap("n", "gS", vim.lsp.buf.signature_help, { desc = "[S]ignature help", buffer = bufnr })
    keymap("n", "K", lsp_hover, { desc = "Hover documentation", buffer = bufnr })
    keymap("n", "[d", diagnostic_goto_prev, { desc = "Go to previous diagnostic problem", buffer = bufnr })
    keymap("n", "]d", diagnostic_goto_next, { desc = "Go to next diagnostic problem", buffer = bufnr })

    -- code actions
    keymap("n", "<leader>ca", "<cmd>CodeActionMenu<CR>", { desc = "Code actions", buffer = bufnr })
    keymap("n", "<A-CR>", "<cmd>CodeActionMenu<CR>", { desc = "Code actions", buffer = bufnr })

    -- rename
    keymap({ "n", "v" }, "<F2>", "<cmd>lua require('renamer').rename()<CR>", { desc = "Rename", buffer = bufnr })
    keymap({ "n", "v" }, "<leader>r", "<cmd>lua require('renamer').rename()<CR>", { desc = "Rename", buffer = bufnr })

    -- inlay hint
    if client.server_capabilities.inlayHintProvider and client.supports_method("textDocument/inlayHint") then
        -- if pcall(vim.lsp.inlay_hint.enable) then

        vim.keymap.set("n", "<leader>h", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle inlay hints" })
    end

    -- code formatting
    -- resolve between LSP API version 0.9 and 0.10
    if client.server_capabilities.documentFormattingProvider or client.supports_method("textDocument/formatting") then
        -- if client.name == "lua_ls" then
        --     client.server_capabilities.documentFormattingProvider = false
        -- end

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })

        keymap("n", "<leader>i", vim.lsp.buf.format, { desc = "Reformat code" })
    end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
