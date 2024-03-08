-----------------------------------------------------------------------
-- NeoVim config module for headlines in markdown files
-----------------------------------------------------------------------

local headlines_status_ok, headlines = pcall(require, "headlines")
if not headlines_status_ok then
	return
end

headlines.setup({
	-- No support for other markup syntaxes
	org = {},
	norg = {},
	rmd = {},
})
