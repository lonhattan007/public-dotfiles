-----------------------------------------------------------------------
-- NeoVim config module for focus lighting
-----------------------------------------------------------------------

return {
	"folke/twilight.nvim",
	config = function()
		require("twilight").setup({
			dimming = {
				-- amount of dimming
				alpha = 0.5,
				-- get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				-- if guibg=NONE, this will be used to calculate text color
				term_bg = "#000000",
				-- when true, other windows will be fully dimmed (unless they contain the same buffer)
				inactive = false,
			},
			-- amount of lines we will try to show around the current line
			context = 10,
			-- use treesitter when available for the filetype
			treesitter = true,
			-- for treesitter, we we always try to expand to the top-most ancestor with these types
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
			},
			-- exclude these filetypes
			exclude = {},
		})

		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle zen mode" })
	end,
}
