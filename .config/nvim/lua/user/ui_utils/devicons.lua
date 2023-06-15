-----------------------------------------------------------------------
-- NeoVim config module for devicons
-----------------------------------------------------------------------

local devicons_status_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status_ok then
    return
end

devicons.setup()
