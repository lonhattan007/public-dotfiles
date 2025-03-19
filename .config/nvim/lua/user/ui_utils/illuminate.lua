-----------------------------------------------------------------------
-- NeoVim config module for illuminating word instances
-----------------------------------------------------------------------

return {
	"rrethy/vim-illuminate",
	config = function()
		-- The setup function name is `configure` instead of `setup`
		-- so we have to it do this way instead of defining `opts`
		local illuminate = require("illuminate")
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

		vim.keymap.set("n", "]r", illuminate.goto_next_reference, { desc = "Move to next reference" })
		vim.keymap.set("n", "[r", illuminate.goto_prev_reference, { desc = "Move to previous reference" })
		vim.keymap.set("n", "<M-n>", "<nop>", { noremap = true })
		vim.keymap.set("n", "<M-p>", "<nop>", { noremap = true })
	end,
}
