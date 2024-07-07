M = {
	"github/copilot.vim",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
			callback = function()
				vim.cmd([[Copilot disable]])
			end,
		})
	end,
}

return {}

