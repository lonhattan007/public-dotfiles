local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dap_ui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local mason_dap_status_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_status_ok then
	return
end

dap_ui.setup({
	layouts = {
		{
			elements = {
				{ id = "watches", size = 0.25 },
				{ id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
			},
			position = "right",
			size = 40,
		},
		{
			elements = {
				-- { id = "console", size = 0.5 },
				{ id = "repl", size = 1 },
			},
			position = "bottom",
			size = 10,
		},
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "Search", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dap_ui.open({ reset = true })
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.open()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.open()
end

mason_dap.setup({
	ensure_installed = {
		-- "python",
		-- "delve",
	},
	automatic_installation = false,
	handlers = {
		function(config)
			mason_dap.default_setup(config)
		end,
	},
})

local wk = require("which-key")
wk.register({
	["d"] = {
		name = "Debugger",
		["b"] = { "<cmd>DapToggleBreakpoint<CR>", "Dap UI toggle" },
		["c"] = { dap_ui.close, "Dap UI close" },
		["e"] = { dap_ui.eval, "Dap UI eval" },
		["o"] = { dap_ui.open, "Dap UI open" },
		["t"] = { dap_ui.toggle, "Dap UI toggle" },
		["r"] = {
			"<cmd>lua require('dapui').open({reset = true})<CR>",
			"Dap UI reset",
		},
	},
}, {
	prefix = "<leader>",
	mode = "n",
	silent = true,
	noremap = true,
})
wk.register({
	["<F5>"] = { "<cmd>DapContinue<CR>", "Continue debug" },
})
