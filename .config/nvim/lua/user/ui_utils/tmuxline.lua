-----------------------------------------------------------------------
-- NeoVim config module for tmux line
-----------------------------------------------------------------------

return {
    "edkolev/tmuxline.vim",
    config = function()
        local g = vim.g

        g.tmuxline_theme = "vim_statusline_3"

        g.tmuxline_preset = {
            a = "#S",
            b = "#W #F",
            -- c = "",
            win = "#I #W",
            cwin = "#I",
            -- x = "%a",
            y = "%R %a",
            z = "#H",
        }

        g.tmuxline_powerline_separators = 0

        -- g.tmuxline_separators = {
        --     ["left"] = " ",
        --     ["left-alt"] = " |",
        --     ["right"] = " ",
        --     ["right-alt"] = "| ",
        --     ["space"] = " ",
        -- }
    end,
}
