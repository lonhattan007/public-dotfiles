-----------------------------------------------------------------------
-- NeoVim config module for markdown preview
-----------------------------------------------------------------------

return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "vim-plug", "vim", "lua" },
		opts = {
			heading = {
				backgrounds = {
					"None",
					"None",
					"None",
					"None",
					"None",
					"None",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"RenderMarkdownH2",
					"RenderMarkdownH3",
					"RenderMarkdownH4",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	build = "cd app && ./install.sh",
	-- 	ft = { "markdown", "vim-plug", "vim", "lua" },
	-- 	config = function()
	-- 		local g = vim.g
	--
	-- 		-- set to 1, nvim will open the preview window after entering the markdown buffer
	-- 		-- default: 0
	-- 		g.mkdp_auto_start = 0
	--
	-- 		-- set to 1, the nvim will auto close current preview window when change
	-- 		-- from markdown buffer to another buffer
	-- 		-- default: 1
	-- 		g.mkdp_auto_close = 1
	--
	-- 		-- set to 1, the vim will refresh markdown when save the buffer or
	-- 		-- leave from insert mode, default 0 is auto refresh markdown as you edit or
	-- 		-- move the cursor
	-- 		-- default: 0
	-- 		g.mkdp_refresh_slow = 0
	--
	-- 		-- set to 1, the MarkdownPreview command can be use for all files,
	-- 		-- by default it can be use in markdown file
	-- 		-- default: 0
	-- 		g.mkdp_command_for_global = 0
	--
	-- 		-- set to 1, preview server available to others in your network
	-- 		-- by default, the server listens on localhost (127.0.0.1)
	-- 		-- default: 0
	-- 		g.mkdp_open_to_the_world = 0
	--
	-- 		-- use custom IP to open preview page
	-- 		-- useful when you work in remote vim and preview on local browser
	-- 		-- more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
	-- 		-- default empty
	-- 		g.mkdp_open_ip = ""
	--
	-- 		-- specify browser to open preview page
	-- 		-- for path with space
	-- 		-- valid: `/path/with  space/xxx`
	-- 		-- invalid: `/path/with   space/xxx`
	-- 		-- default: ''
	-- 		g.mkdp_browser = ""
	--
	-- 		-- set to 1, echo preview page url in command line when open preview page
	-- 		-- default is 0
	-- 		g.mkdp_echo_preview_url = 0
	--
	-- 		-- a custom vim function name to open preview page
	-- 		-- this function will receive url as param
	-- 		-- default is empty
	-- 		g.mkdp_browserfunc = ""
	--
	-- 		-- options for markdown render
	-- 		-- mkit: markdown-it options for render
	-- 		-- katex: katex options for math
	-- 		-- uml: markdown-it-plantuml options
	-- 		-- maid: mermaid options
	-- 		-- disable_sync_scroll: if disable sync scroll, default 0
	-- 		-- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
	-- 		--   middle: mean the cursor position alway show at the middle of the preview page
	-- 		--   top: mean the vim top viewport alway show at the top of the preview page
	-- 		--   relative: mean the cursor position alway show at the relative positon of the preview page
	-- 		-- hide_yaml_meta: if hide yaml metadata, default is 1
	-- 		-- sequence_diagrams: js-sequence-diagrams options
	-- 		-- content_editable: if enable content editable for preview page, default: v:false
	-- 		-- disable_filename: if disable filename header for preview page, default: 0
	-- 		g.mkdp_preview_options = {
	-- 			mkit = {},
	-- 			katex = {},
	-- 			uml = {},
	-- 			maid = {},
	-- 			disable_sync_scroll = 0,
	-- 			sync_scroll_type = "middle",
	-- 			hide_yaml_meta = 1,
	-- 			sequence_diagrams = {},
	-- 			flowchart_diagrams = {},
	-- 			content_editable = { v = false },
	-- 			disable_filename = 0,
	-- 			toc = {},
	-- 		}
	--
	-- 		-- use a custom markdown style must be absolute path
	-- 		-- like '/Users/username/markdown.css' or expand('~/markdown.css')
	-- 		g.mkdp_markdown_css = ""
	--
	-- 		-- use a custom highlight style must absolute path
	-- 		-- like '/Users/username/highlight.css' or expand('~/highlight.css')
	-- 		g.mkdp_highlight_css = ""
	--
	-- 		-- use a custom port to start server or empty for random
	-- 		g.mkdp_port = "7075"
	--
	-- 		-- preview page title
	-- 		-- ${name} will be replace with the file name
	-- 		g.mkdp_page_title = "「${name}」"
	--
	-- 		-- recognized filetypes
	-- 		-- these filetypes will have MarkdownPreview... commands
	-- 		g.mkdp_filetypes = { "markdown" }
	--
	-- 		-- set default theme (dark or light)
	-- 		-- By default the theme is define according to the preferences of the system
	-- 		g.mkdp_theme = "dark"
	--
	-- 		vim.keymap.set("n", "<leader>v", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
	-- 	end,
	-- },
}
