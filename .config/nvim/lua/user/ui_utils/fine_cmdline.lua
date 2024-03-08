-----------------------------------------------------------------------
-- NeoVim config module for command palette
-----------------------------------------------------------------------

local cmdline_status_ok, cmdline = pcall(require, "fine-cmdline")
if not cmdline_status_ok then
	return
end

local abbrevs = require("user.base.abbrevs")

cmdline.setup({
	hooks = {
		-- Define cabbrevs here
		set_keymaps = function(imap, feedkeys)
			for abbrev, command in pairs(abbrevs.command) do
				imap(abbrev, command)
			end
		end,
	},
})
