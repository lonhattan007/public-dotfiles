-----------------------------------------------------------------------
-- NeoVim config module for traning good habits in using motions
-----------------------------------------------------------------------

local hardtime_status_ok, hardtime = pcall(require, "hardtime")
if not hardtime_status_ok then
	return
end

hardtime.setup({
	max_time = 1000,
	max_count = 5,
	disable_mouse = false,
	hint = true,
	allow_different_key = false,
	-- hint_keys = { "k", "j", "^", "$", "a", "x", "i", "d", "y", "c", "l" },
	hint_keys = {},
	resetting_keys = {
		["1"] = { "n", "v" },
		["2"] = { "n", "v" },
		["3"] = { "n", "v" },
		["4"] = { "n", "v" },
		["5"] = { "n", "v" },
		["6"] = { "n", "v" },
		["7"] = { "n", "v" },
		["8"] = { "n", "v" },
		["9"] = { "n", "v" },
		["c"] = { "n" },
		["C"] = { "n" },
		["d"] = { "n" },
		["x"] = { "n" },
		["X"] = { "n" },
		["y"] = { "n" },
		["Y"] = { "n" },
		["p"] = { "n" },
		["P"] = { "n" },
	},
	restricted_keys = {
		["h"] = { "n", "v" },
		["j"] = { "n", "v" },
		["k"] = { "n", "v" },
		["l"] = { "n", "v" },
		["-"] = { "n", "v" },
		["+"] = { "n", "v" },
		["gj"] = { "n", "v" },
		["gk"] = { "n", "v" },
		["<CR>"] = { "n", "v" },
		["<C-M>"] = { "n", "v" },
		["<C-N>"] = { "n", "v" },
		["<C-P>"] = { "n", "v" },
	},
	disabled_keys = {
		["<Up>"] = {},
		["<Down>"] = {},
		["<Left>"] = {},
		["<Right>"] = {},
	},
	disabled_filetypes = {
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
