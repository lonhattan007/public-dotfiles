-----------------------------------------------------------------------
-- NeoVim config module for Github colorscheme
-----------------------------------------------------------------------

local github_theme_status_ok, github_theme = pcall(require, "github-nvim-theme")
if not github_theme_status_ok then
    return
end

github_theme.setup({
	transparent = vim.g.transparent_enabled,
	terminal_colors = false,
	dim_inactive = false,
	styles = {
		comments = 'italic',       -- Value is any valid attr-list value `:help attr-list`
		functions = 'italic',
		keywords = 'NONE',
		variables = 'italic',
		conditionals = 'italic',
		constants = 'NONE',
		numbers = 'NONE',
		operators = 'NONE',
		strings = 'NONE',
		types = 'NONE',
	}
})
