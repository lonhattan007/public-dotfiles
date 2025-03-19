-----------------------------------------------------------------------
-- NeoVim config module for outline tree
-----------------------------------------------------------------------

return {
	"stevearc/aerial.nvim",
	opts = {
		backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
		layout = {
			max_width = { 40, 0.2 },
			width = nil,
			min_width = 10,
		},
		default_direction = "prefer_right",
	},
}
