-----------------------------------------------------------------------
-- NeoVim config module for surrounding codes with brackets or marks
-----------------------------------------------------------------------

local surround_status_ok, surround = pcall(require, "nvim-surround")
if not surround_status_ok then
    return
end

surround.setup({})
