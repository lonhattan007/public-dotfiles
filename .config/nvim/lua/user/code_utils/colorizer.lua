-----------------------------------------------------------------------
-- NeoVim config module for color code highlighter
-----------------------------------------------------------------------

local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
	return
end

colorizer.setup({
	user_default_options = {
		filetypes = {
			"css",
			"scss",
			"javascript",
			"typescript",
			"jsx",
			"tsx",
			"dart",
			"toml",
			"sh",
			"dosini",
			html = { mode = "foreground" },
		},
		mode = "virtualtext",
		virtualtext = "■",
		AARRGGBB = true, -- 0xAARRGGBB hex codes
	},
})
