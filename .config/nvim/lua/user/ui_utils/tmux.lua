-----------------------------------------------------------------------
-- NeoVim config module for tmux integration
-----------------------------------------------------------------------

M = {
	"edkolev/tmuxline.vim",
	config = function()
		local g = vim.g

		g.tmuxline_theme = "vim_statusline_3"

		g.tmuxline_preset = {
			a = "#I #W",
			b = "",
			-- c = "",
			-- win = "#I #W",
			-- cwin = "#I",
			-- x = "%a",
			y = "#S",
			z = "#H",
			-- a = "#S",
			-- b = "#W #F",
			-- -- c = "",
			-- win = "#I #W",
			-- cwin = "#I",
			-- -- x = "%a",
			-- y = "%R %a",
			-- z = "#H",
		}

		g.tmuxline_powerline_separators = 0

		g.tmuxline_separators = {
			["left"] = " ",
			["left-alt"] = " |",
			["right"] = " ",
			["right-alt"] = "| ",
			["space"] = " ",
		}
	end,
}

return {
	-- tmux motion integration
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
		config = function()
			local keymap = vim.keymap.set

			-- keymap("n", "<space>h", "<cmd>TmuxNavigateLeft<CR>", { desc = "Focus on left pane" })
			-- keymap("n", "<space>j", "<cmd>TmuxNavigateDown<CR>", { desc = "Focus on lower pane" })
			-- keymap("n", "<space>k", "<cmd>TmuxNavigateUp<CR>", { desc = "Focus on uppper pane" })
			-- keymap("n", "<space>l", "<cmd>TmuxNavigateRight<CR>", { desc = "Focus on right pane" })
			keymap("n", "<C-S-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux navigate left" })
			keymap("n", "<C-S-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux navigate lower" })
			keymap("n", "<C-S-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux navigate uppper" })
			keymap("n", "<C-S-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux navigate right" })
		end,
	},
}
