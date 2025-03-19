-----------------------------------------------------------------------
-- NeoVim config module for project folder manager
-----------------------------------------------------------------------

return {
	-- "ahmedkhalf/project.nvim",
	"lonhattan007/project.nvim",
	priority = 100,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("project_nvim").setup({
			active = true,
			manual_mode = false,
			detection_methods = {
				"lsp",
				"pattern",
			},
			patterns = {
				".git",
				".obsidian",
				"Makefile",
				"package.json",
				"pubspec.yaml",
				"go.mod",
				"Cargo.toml",
				"pom.xml",
				"!=node_modules",
				"!>node_modules",
				"!=nvim",
			},
			exclude_dirs = {
				"~",
				"*/OSsetup/*",
				"~/.config/*",
				"*/nvim/*",
				"*\\nvim",
				"*/node_modules/*",
			},
			show_hidden = false,
			use_git_files = true,
			datapath = vim.fn.stdpath("data"),
		})
	end,
}
