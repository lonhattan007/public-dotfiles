-----------------------------------------------------------------------
-- NeoVim config module for iron
-----------------------------------------------------------------------

local iron_status_ok, iron = pcall(require, "iron.core")
if not iron_status_ok then
	return
end

iron.setup({
	config = {
		-- Highlights the last sent block with bold
		highlight_last = "IronLastSent",

		-- Toggling behavior is on by default.
		-- Other options are: `single` and `focus`
		visibility = require("iron.visibility").toggle,

		-- Scope of the repl
		-- By default it is one for the same `pwd`
		-- Other options are `tab_based` and `singleton`
		scope = require("iron.scope").path_based,

		-- Whether the repl buffer is a "throwaway" buffer or not
		scratch_repl = false,

		-- Automatically closes the repl window on process end
		close_window_on_exit = true,
		repl_definition = {
			-- forcing a default
			-- python = require("iron.fts.python").ipython,
			python = {
				command = { "ipython" },
				format = require("iron.fts.common").bracketd_paste,
			},

			-- new, custom repl
			-- lua = {
			-- Can be a table or a function that returns a table (see below)
			--   command = {"my-lua-repl", "-arg"}
			-- }
		},

		-- Repl position. Check `iron.view` for more options,
		-- currently there are four positions: left, right, bottom, top,
		-- the param is the width/height of the float window
		-- repl_open_cmd = require("iron.view").curry.bottom(40),
		-- Alternatively, pass a function, which is evaluated when a repl is open.
		repl_open_cmd = require("iron.view").right(function()
			return math.floor(vim.o.columns / 2)
		end),
		-- iron.view.curry will open a float window for the REPL.
		-- alternatively, pass a string of vimscript for opening a fixed window:
		-- repl_open_cmd = "belowright 15 split",

		-- If the repl buffer is listed
		buflisted = false,
	},
	keymaps = {},
	highlight = {
		italic = true,
	},
	ignore_blank_line = true, -- ignore blank lines when sending visual select lines
})
