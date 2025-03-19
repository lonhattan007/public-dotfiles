-----------------------------------------------------------------------
-- NeoVim config module for code commenting
-----------------------------------------------------------------------

return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
	{
		"numtostr/comment.nvim",
		config = function()
			require("Comment").setup({
				---Add a space b/w comment and the line
				padding = true,
				---Whether the cursor should stay at its position
				sticky = true,
				---Lines to be ignored while (un)comment
				ignore = nil,
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "gcc",
					---Block-comment toggle keymap
					block = "gbc",
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = "gc",
					---Block-comment keymap
					block = "gb",
				},
				---LHS of extra mappings
				extra = {
					---Add comment on the line above
					above = "gcO",
					---Add comment on the line below
					below = "gco",
					---Add comment at the end of line
					eol = "gcA",
				},
				---Enable keybindings
				---NOTE: If given `false` then the plugin won't create any mappings
				mappings = {
					---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
					basic = true,
					---Extra mapping; `gco`, `gcO`, `gcA`
					extra = true,
				},
				---Function to call before (un)comment
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
				---Function to call after (un)comment
				post_hook = nil,
			})

			local keymap = vim.keymap.set

			keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle line comment" })
			keymap("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle line comment" })

			keymap(
				"i",
				"<C-_>",
				"<cmd>lua require('Comment.api').toggle.linewise()<CR>",
				{ desc = "Toggle line comment" }
			)
			keymap(
				"i",
				"<C-/>",
				"<cmd>lua require('Comment.api').toggle.linewise()<CR>",
				{ desc = "Toggle line comment" }
			)

			keymap("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle line comment" })
			keymap("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle line comment" })
		end,
	},
}
