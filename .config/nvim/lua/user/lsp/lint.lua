-----------------------------------------------------------------------
-- NeoVim config module for Linters
-----------------------------------------------------------------------

M = {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		local util = require("lint.util")

		lint.linters.cspell = util.wrap(lint.linters.cspell, function(diagnostic)
			diagnostic.severity = vim.diagnostic.severity.WARN
			return diagnostic
		end)

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
				--
				-- You can call `try_lint` with a linter name or a list of names to always
				-- run specific linters, independent of the `linters_by_ft` configuration
				lint.try_lint("cspell")
			end,
		})
	end,
}

return {}
