-----------------------------------------------------------------------
-- NeoVim config module for key bindings recognizer
-----------------------------------------------------------------------

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.setup()

		wk.add({
			mode = "n",
			{
				"<leader>wk",
				function()
					wk.show({ global = true })
				end,
				desc = "Turn on which-key manual",
			},
		})

		-- register groups
		wk.add({
			{ "<space>", group = "Working with panes" },
			{ "<leaser>s", group = "Telescope search utils" },
			{ "<leaser>d", group = "Debugger" },
			{ "<leaser>o", group = "Obsidian" },
		})
	end,
}
