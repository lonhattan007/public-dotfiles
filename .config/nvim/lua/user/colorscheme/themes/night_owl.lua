-----------------------------------------------------------------------
-- NeoVim config module for Catppuccin colorscheme
-----------------------------------------------------------------------

local M = {
	"oxfist/night-owl.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		bold = true,
		italics = true,
		underline = false,
		undercurl = false,
		transparent_background = vim.g.transparent_enabled or false,
	},
}

return {}
