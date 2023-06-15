-----------------------------------------------------------------------
-- NeoVim config module for auto close brackets
-----------------------------------------------------------------------

local autopairs_status_ok, auto_pairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then
    return
end

auto_pairs.setup({})
