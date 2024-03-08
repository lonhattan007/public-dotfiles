-----------------------------------------------------------------------
-- NeoVim config module for LSPs, DAPs, linters and formatters manager
-----------------------------------------------------------------------

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

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

local mason_tool_status_ok, mason_tool = pcall(require, "mason-tool-installer")
if not mason_tool_status_ok then
	return
end

mason_tool.setup({
	ensure_installed = {
		"prettier", -- prettier_d
		"isort",
		"black",
		-- "gofmt", -- comes with go
		-- "dart_format", -- comes with dart SDK
		"clang-format",
		"stylua",
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

-- local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
-- if not mason_null_ls_ok then
-- 	return
-- end
--
-- mason_null_ls.setup({
-- 	ensure_installed = {
-- 		"prettier", -- prettier_d
-- 		"isort",
-- 		"black",
-- 		-- "gofmt", -- comes with go
-- 		-- "dart_format", -- comes with dart SDK
-- 		"stylua",
-- 		"rustywind",
-- 		-- "stylelint_lsp",
-- 		-- "markdownlint",
-- 		-- "mdformat",
-- 		-- "cspell",
-- 	},
-- 	automatic_installation = false,
-- })
