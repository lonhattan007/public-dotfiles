-----------------------------------------------------------------------
-- NeoVim config module for opening items in quick fix in splits/tabs
-----------------------------------------------------------------------

return {
	"yssl/QFEnter",
	config = function()
		vim.g.qfenter_keymap = {
			vopen = { "<C-v>" },
			hopen = { "<C-CR>", "<C-s>", "<C-x>" },
			topen = { "<C-t>" },
		}
	end,
}
