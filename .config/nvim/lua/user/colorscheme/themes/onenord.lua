-----------------------------------------------------------------------
-- NeoVim config module for plugins management
-----------------------------------------------------------------------

local onenord_status_ok, onenord = pcall(require, "onenord")
if not onenord_status_ok then
	return
end

require("onenord").setup({
	theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = true, -- Split window borders
	fade_nc = false, -- Fade non-current windows, making them more distinguishable
	-- Style that is applied to various groups: see `highlight-args` for options
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "NONE",
		functions = "italic",
		variables = "italic",
		diagnostics = "underline",
	},
	disable = {
		background = true, -- Disable setting the background color
		float_background = true, -- Disable setting the background color for floating windows
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	-- Inverse highlight for different groups
	inverse = {
		match_paren = false,
	},
	custom_highlights = {}, -- Overwrite default highlight groups
	custom_colors = {}, -- Overwrite default colors
})
