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

			local keymap = vim.keymap.set

			keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle [D]ebug [B]reakpoint" })
			keymap("n", "<leader>dc", dap_ui.close, { desc = "[D]ap UI [C]lose" })
			keymap("n", "<leader>de", dap_ui.eval, { desc = "[D]ap UI [E]val" })
			keymap("n", "<leader>do", dap_ui.open, { desc = "[D]ap UI [O]pen" })
			keymap("n", "<leader>dt", dap_ui.toggle, { desc = "[D]ap UI [T]oggle" })
			keymap(
				"n",
				"<leader>dr",
				"<cmd>lua require('dapui').open({reset = true})<CR>",
				{ desc = "[D]ap UI [R]eset" }
			)
			keymap("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "Continue debug" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
	{
		"mxsdev/nvim-dap-vscode-js",
		opts = {
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
			debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
			debugger_cmd = { "js-debug-adapter" },
		},
	},
}

return M
