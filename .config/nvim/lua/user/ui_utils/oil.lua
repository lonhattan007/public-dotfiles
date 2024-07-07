-----------------------------------------------------------------------
-- NeoVim config module for Oil file manager
-----------------------------------------------------------------------

return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
