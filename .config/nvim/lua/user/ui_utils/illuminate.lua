-----------------------------------------------------------------------
-- NeoVim config module for illuminating word instances
-----------------------------------------------------------------------

local illuminate_status_ok, illuminate = pcall(require, "illuminate")
if not illuminate_status_ok then
	return
end

illuminate.configure({
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
