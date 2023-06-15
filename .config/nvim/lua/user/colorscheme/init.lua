-----------------------------------------------------------------------
-- NeoVim config module for setting colorschemes
-----------------------------------------------------------------------

if not vim.g.neovide then
    require("user.colorscheme.transparent")
end

require("user.colorscheme.themes")
local utils = require("user.colorscheme.utils")

vim.cmd("syntax on")
vim.o.termguicolors = true

-- Backgrounds for some colorschemes
-- Available options:
-- 	light		dark
vim.o.background = "dark"

if os.getenv("TMUX") == nil then
    -- If not running in tmux
    utils.load_colorscheme()

    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function(args)
            -- args is a table of arguments passed to the callback function
            -- match is the <amatch> value of the event "ColorScheme", which is
            -- the newle set colorscheme
            -- This is not called when in tmux to ensure a similar colorscheme
            -- between vim and tmux
            utils.write_colorscheme(args.match)
        end,
    })
else
    vim.cmd("colorscheme catppuccin")
end
