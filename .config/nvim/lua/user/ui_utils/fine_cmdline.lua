-----------------------------------------------------------------------
-- NeoVim config module for command palette
-----------------------------------------------------------------------

return {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { "muniftanjim/nui.nvim" },
    config = function()
        local cmdline = require("fine-cmdline")
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
    end,
}
