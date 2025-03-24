-----------------------------------------------------------------------
-- NeoVim config module for Kanagawa colorscheme
-----------------------------------------------------------------------

return {
	"rebelot/kanagawa.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = { italic = true },
		keywordStyle = {},
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = true },
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = false, -- vim.g.transparent_enabled or false,
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		globalStatus = false, -- adjust window separators highlight for laststatus=3
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {},
		theme = {
			dark = "wave",
			light = "lotus",
			default = "wave",
		},
		overrides = function(colors) -- for transparent floating windows
			local theme = colors.theme
			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },
				NormalDark = {
					fg = theme.ui.fg_dim,
					bg = theme.ui.bg_m3,
				},
				MasonNormal = { bg = "none", fg = theme.ui.fg_dim },
				LazyNormal = { bg = "none", fg = theme.ui.fg_dim },
				LazyBorder = {
					fg = theme.ui.fg_dim,
					bg = "none",
				},
				TelescopeNormal = { bg = "none" },
				TelescopeBorder = {
					fg = theme.ui.fg_dim,
					bg = "none",
				},
				NvimTreeNormal = {
					bg = theme.ui.bg_dim,
				},
			}
		end,
	},
}
