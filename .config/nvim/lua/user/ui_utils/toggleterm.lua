-----------------------------------------------------------------------
-- NeoVim config module for integrated terminal
-----------------------------------------------------------------------

local path_sep = require("user.utils").path_sep

return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				border = "curved",
			},
			persist_mode = true, -- always in terminal mode when open
			shell = function()
				if path_sep == "\\" then
					return "pwsh.exe -NoLogo"
				else
					return vim.o.shell
				end
			end,
		})

		vim.keymap.set({ "n", "v", "t" }, "<leader>`", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
	end,
}
