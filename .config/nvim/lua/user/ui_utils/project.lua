-----------------------------------------------------------------------
-- NeoVim config module for project folder manager
-----------------------------------------------------------------------

local project_enabled = require("user.base.opts").project.enabled

local M = {
	-- "ahmedkhalf/project.nvim",
	"lonhattan007/project.nvim",
    branch = "chore/fix-deprecated-api",
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

        require("telescope").load_extension("projects")
	end,
}

return project_enabled and M or {}
