--[[
=====================================================================
======================== MY NEOVIM CONFIG ===========================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||       NEOVIM       ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
============================================== Art by T. J. Devries =
=====================================================================
--]]

if vim.g.vscode then
    require("user.vscode")
else
    -- General settings
    require("user.base")

    -- Plugins installation
    require("user.plugins")

    -- Colorscheme and syntax highlighting
    require("user.colorscheme")

    local vim_version = vim.version()
    if vim_version.major == 0 and vim_version.minor >= 11 then
        local notify_original = vim.notify
        vim.notify = function(msg, ...)
            if msg
                and (
                    msg:match('position_encoding param is required')
                )
            then
                return
            end
            return notify_original(msg, ...)
        end
    end
end
