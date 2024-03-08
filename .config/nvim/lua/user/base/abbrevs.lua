-----------------------------------------------------------------------
-- NeoVim config module for defining abbreviations
-----------------------------------------------------------------------

M = {}

-- Abbreviations for command mode
M.command = {
	-- Abbreviations for Vim-Plug
	["PI"] = "PlugInstall",
	["PU"] = "PlugUpdate",
	["PC"] = "PlugClean",
	-- Abbreviations for Telescope
	["TL"] = "Telescope",
	-- Abbreviations for LSP information
	["LI"] = "LspInfo",
	["LS"] = "LspStart",
	["LR"] = "LspRestart",
	["LC"] = "LspStop",
	-- ["NI"] = "NullLsInfo",
	-- Abbreviations for saving
	["W"] = "w",
	-- Abbreviations for WhickKey
	["?"] = "WhichKey",
	-- Abbreviations for Iron
	["IA"] = "IronAttach",
	["IF"] = "IronFocus",
	["IH"] = "IronHide",
	["IO"] = "IronRepl",
	["IR"] = "IronRestart",
	["IW"] = "IronWatch",
}

return M
