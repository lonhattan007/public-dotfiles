-----------------------------------------------------------------------
-- NeoVim config module for auto close tags
-----------------------------------------------------------------------

return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPre", "BufNewFile", "InsertEnter" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = false,
		},
	},
}
