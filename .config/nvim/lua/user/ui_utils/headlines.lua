-----------------------------------------------------------------------
-- NeoVim config module for headlines in markdown files
-----------------------------------------------------------------------

M = {
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			-- No support for other markup syntaxes
			org = {},
			norg = {},
			rmd = {},
		},
	},
}

return {}
