-----------------------------------------------------------------------
-- NeoVim config module for submode bindings
-----------------------------------------------------------------------

return {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = function()
        local Hydra = require("hydra")

        local opts = { silent = true, noremap = true }

        Hydra({
            name = "Panes",
            hint = false,
            mode = "n",
            body = "<C-w>",
            heads = {
                { "s", "<cmd>split<CR>", opts },
                { "v", "<cmd>vsplit<CR>", opts },
                { "h", "<cmd>wincmd h<CR>", opts },
                { "j", "<cmd>wincmd j<CR>", opts },
                { "k", "<cmd>wincmd k<CR>", opts },
                { "l", "<cmd>wincmd l<CR>", opts },
                { "t", "<C-w>T", opts },
                { "H", "<C-w>H", opts },
                { "J", "<C-w>J", opts },
                { "K", "<C-w>K", opts },
                { "L", "<C-w>L", opts },
                { "<Up>", "<C-w>+", opts },
                { "<Down>", "<C-w>-", opts },
                { "<Left>", "<C-w><", opts },
                { "<Right>", "<C-w>>", opts },
                { "=", "<C-w>=", opts },
            },
        })
    end,
}
