-----------------------------------------------------------------------
-- NeoVim config module for LSP config options
-----------------------------------------------------------------------

local M = {}

M.language_servers = {
	-- My fav --------------------------
	-- "efm",
	-- "pylsp",
	-- "pyright",
	-- "gopls",
	-- "dartls", -- Included in flutter-tools
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
	-- "denols",
	-- Android stuff -------------------
	-- "kotlin_language_server",
	-- "jdtls",
	-- "groovyls",
	-- Back end stuff ------------------
	-- "omnisharp", -- dotnet
	-- "prismals",
	-- "graphql",
	-- "sqlls",
	-- Other stuff ---------------------
	-- "lua_ls",
	-- "rust_analyzer",
	-- "clangd",
}

local wk = require("which-key")

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
			if client_.name == "tsserver" then
				client_.stop()
			end
		end
	elseif client.name == "tsserver" then
		for _, client_ in pairs(active_clients) do
			-- prevent tsserver from starting if denols is already active
			if client_.name == "denols" then
				client.stop()
			end
		end
	end

	-- setting up keymaps used by LSP
	local builtin = require("telescope.builtin")
	local bufopts = { mode = "n", noremap = true, silent = true, buffer = bufnr }
	wk.register({
		["gd"] = {
			builtin.lsp_definitions,
			"[G]o to [D]efinition",
		},
		["gi"] = {
			vim.lsp.buf.implementation,
			"[G]o to [I]mplementation",
		},
		["<leader>si"] = {
			builtin.lsp_implementations,
			"[S]earch [I]mplementation",
		},
		["gr"] = {
			vim.lsp.buf.references,
			"[G]o to [R]eferences",
		},
		["<leader>sr"] = {
			builtin.lsp_references,
			"[S]earch [R]eferences",
		},
		["<leader>ds"] = {
			builtin.document_symbols,
			"[D]ocument [S]ymbols",
		},
		["<leader>ws"] = {
			builtin.lsp_dynamic_workspace_symbols,
			"[W]orkspace dynamic [S]ymbols",
		},
		["gs"] = {
			vim.lsp.buf.signature_help,
			"[S]ignature help",
		},
		["K"] = {
			vim.lsp.buf.hover,
			"Hover documentation",
		},
		["[d"] = {
			vim.diagnostic.goto_prev,
			-- "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",
			"Go to previous diagnostic problem",
		},
		["]d"] = {
			vim.diagnostic.goto_next,
			-- "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
			"Go to next diagnostic problem",
		},
	}, bufopts)

	-- code actions
	wk.register({
		["<leader>c"] = {
			name = "Code actions",
			["a"] = { "<cmd>CodeActionMenu<CR>", "[C]ode [A]ctions" },
			-- ["a"] = { vim.lsp.buf.code_action, "Code actions" },
			-- ["m"] = { "<cmd>CodeActionMenu<CR>", "Code actions menu" },
		},
		["<A-CR>"] = {
			"<cmd>CodeActionMenu<CR>",
			"Code actions",
		},
	}, bufopts)

	-- renamer
	wk.register({
		["<F2>"] = { "<cmd>lua require('renamer').rename()<CR>", "Rename" },
		["<leader>r"] = {
			"<cmd>lua require('renamer').rename()<CR>",
			"[R]ename",
		},
	}, {
		mode = { "n", "v" },
		silent = true,
		noremap = true,
		buffer = bufnr,
	})

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

		wk.register({
			["<leader>i"] = { vim.lsp.buf.format, "Reformat code" },
		}, bufopts)
	end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
