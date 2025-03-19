-----------------------------------------------------------------------
-- NeoVim config module for Tokyo Night colorscheme
-----------------------------------------------------------------------

return {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		style = "storm",
		light_style = "day",
		transparent = vim.g.transparent_enabled or false,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true },
			variables = { italic = true },
			sidebars = vim.g.transparent_enabled and "transparent" or "dark",
			floats = "transparent",
		},
		cache = false,
		day_brightness = 0.3,
		hide_inactive_statusline = false,
		dim_inactive = false,
		lualine_bold = false,
	},
}
