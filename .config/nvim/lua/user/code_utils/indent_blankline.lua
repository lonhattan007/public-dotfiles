-----------------------------------------------------------------------
-- NeoVim config module for virtual text highlighting on whitespaces
-----------------------------------------------------------------------

local ibl_status_ok, ibl = pcall(require, "ibl")
if not ibl_status_ok then
	return
end

ibl.setup({
	-- indent = { char = "|" },
})
