-----------------------------------------------------------------------
-- NeoVim config module for LSP fidget icon
-----------------------------------------------------------------------

local fidget_status_ok, fidget = pcall(require, "fidget")
if not fidget_status_ok then
	return
end

fidget.setup({
	notification = {
		window = {
			winblend = 0,
			border = "rounded",
		},
	},
})
