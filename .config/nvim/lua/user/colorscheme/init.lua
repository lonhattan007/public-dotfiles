-----------------------------------------------------------------------
-- NeoVim config module for setting colorschemes
-----------------------------------------------------------------------

local utils = require("user.colorscheme.utils")

-- Backgrounds for some colorschemes
-- Available options:
-- 	light		dark
vim.o.background = "dark"

utils.load_colorscheme()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function(args)
        -- args is a table of arguments passed to the callback function
        -- match is the <amatch> value of the event "ColorScheme", which is
        -- the newly set colorscheme
        utils.write_colorscheme(args.match)

        -- Also change the Tmuxline colorscheme
        -- And snapshot it to cache
        utils.update_tmuxline(args.match)
    end,
})
