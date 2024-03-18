M = {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = { "rcarriga/nvim-dap-ui" },
		config = function()
			local dap = require("dap")
			local dap_ui = require("dapui")

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

			local wk = require("which-key")
			wk.register({
				["d"] = {
					name = "Debugger",
					["b"] = {
						"<cmd>DapToggleBreakpoint<CR>",
						"Toggle debug breakpoint",
					},
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
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {
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
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
		config = function()
			local mason_dap = require("mason-nvim-dap")
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
		end,
	},
}

return {}
