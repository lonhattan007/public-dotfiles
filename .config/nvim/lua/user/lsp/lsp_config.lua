----------------------------------------------------------------------l-
-- NeoVim config module for LSP configs
-----------------------------------------------------------------------

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lsp = require("mason-lspconfig")

		-- LspInfo window border
		require("lspconfig.ui.windows").default_options.border = "single"

		-- Handler configs
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
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

		local lsp_options = require("user.lsp.config.lsp_options")
		local language_servers = lsp_options.language_servers
		local on_attach = lsp_options.on_attach
		local capabilities = lsp_options.capabilities
		local efm_options = require("user.lsp.config.efm").options
		local util = lspconfig.util
		local root_pattern = lspconfig.util.root_pattern

		-- Package management
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
			["efm"] = function()
				lspconfig["efm"].setup(efm_options)
			end,
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
								-- library = vim.api.nvim_get_runtime_file("", true),
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
								checkThirdParty = false,
							},
							hint = { enable = true },
						},
					},
					completion = {
						callSnippet = "Replace",
					},
				})
			end,
			["clangd"] = function()
				lspconfig["clangd"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					cmd = {
						"clangd",
						"--offset-encoding=utf-16",
					},
					completion = {
						callSnippet = "Replace",
					},
				})
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					completion = {
						callSnippet = "Replace",
					},
					filetypes = {
						"html",
						"css",
						"sass",
						"scss",
						"less",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"svelte",
						"markdown",
						"xml",
					},
				})
			end,
			["cssls"] = function()
				lspconfig["cssls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					completion = {
						callSnippet = "Replace",
					},
					settings = {
						css = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				})
			end,
			["tailwindcss"] = function()
				lspconfig["tailwindcss"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					root_dir = root_pattern("tailwind.config.js", "tailwind.config.ts"),
					completion = {
						callSnippet = "Replace",
					},
					filetypes = {
						"astro",
						"astro-markdown",
						"blade",
						"html",
						"html-eex",
						"mdx",
						"php",
						"razor",
						"css",
						"less",
						"postcss",
						"sass",
						"scss",
						"stylus",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"svelte",
					},
				})
			end,
			["ts_ls"] = function()
				lspconfig["ts_ls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					root_dir = function(fname)
						return root_pattern("package.json", "tsconfig.json")(fname) or util.path.dirname(fname)
					end,
					single_file_support = true,
					completion = {
						callSnippet = "Replace",
					},
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								-- location = "~/.nvm/versions/node/v18.20.2/lib/node_modules/@vue/typescript-plugin",
								-- For a dynamic setup, I would install the plugin as a dev-dependency with projects.
								-- In that case, this `location` option must still be set, but can be any value
								-- I choose `true` cause it just makes sense
								location = true,
								languages = { "javascript", "typescript", "vue" },
							},
						},
					},
					filetypes = {
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"vue",
					},
					settings = {
						javascript = {
							inlayHints = {
								includeInlayEnumMemberValueHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayVariableTypeHints = true,
							},
						},
						typescript = {
							inlayHints = {
								includeInlayEnumMemberValueHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayVariableTypeHints = true,
							},
						},
					},
				})
			end,
			["denols"] = function()
				lspconfig["denols"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					root_dir = root_pattern("deno.json", "deno.jsonc"),
					completion = {
						callSnippet = "Replace",
					},
				})
			end,
		})

		if vim.fn.executable("sourcekit-lsp") == 1 then
			lspconfig["sourcekit"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "sourcekit-lsp" },
				filetypes = { "swift" },
				root_dir = root_pattern("Package.swift", ".git", "*"),
				completion = {
					callSnippet = "Replace",
				},
			})
		end
	end,
}
