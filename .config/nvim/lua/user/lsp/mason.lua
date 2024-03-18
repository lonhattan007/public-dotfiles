-----------------------------------------------------------------------
-- NeoVim config module for LSPs, DAPs, linters and formatters manager
-----------------------------------------------------------------------

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				border = {
					"╭",
					"─",
					"╮",
					"│",
					"╯",
					"─",
					"╰",
					"│",
				},
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				max_concurrent_installers = 4,
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "prettier", -- prettier_d
				-- "isort",
				-- "black",
				-- "gofmt", -- comes with go
				-- "dart_format", -- comes with dart SDK
				-- "clang-format",
				-- "stylua",
				-- "rustywind",
				-- "stylelint_lsp",
				-- "markdownlint",
				-- "mdformat",
				-- "cspell",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 5,
		})
	end,
}
