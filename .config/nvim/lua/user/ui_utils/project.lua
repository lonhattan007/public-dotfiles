-----------------------------------------------------------------------
-- NeoVim config module for project folder manager
-----------------------------------------------------------------------

local project_status_ok, project = pcall(require, "project_nvim")
if not project_status_ok then
	return
end

project.setup({
	active = true,
	manual_mode = false,
	detection_methods = {
		-- "lsp",
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
