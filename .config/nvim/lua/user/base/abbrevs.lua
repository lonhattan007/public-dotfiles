-----------------------------------------------------------------------
-- NeoVim config module for defining abbreviations
-----------------------------------------------------------------------

M = {}

-- Abbreviations for command mode
M.command = {
	-- Vertical help menu
	["vh"] = "vert help",
	-- Vim-Plug
	["PI"] = "Lazy install", -- plugin install
	["PU"] = "Lazy update", -- plugin update
	["PC"] = "Lazy clear", -- plugin clear
	["PS"] = "Lazy sync", -- plugin sync
	-- Telescope
	["TL"] = "Telescope",
	["FL"] = "Flutter",
	-- LSP
	["LI"] = "LspInfo",
	["LA"] = "LspStart", -- short for Lsp Attach
	["LR"] = "LspRestart",
	["LS"] = "LspStop",
	-- ["NI"] = "NullLsInfo",
	-- Diffview
	["DO"] = "DiffviewOpen",
	["DC"] = "DiffviewClose",
	-- Write file
	["W"] = "w",
	-- WhickKey
	["?"] = "WhichKey",
	-- Iron Repl
	["IA"] = "IronAttach",
	["IF"] = "IronFocus",
	["IH"] = "IronHide",
	["IO"] = "IronRepl",
	["IR"] = "IronRestart",
	["IW"] = "IronWatch",
}

return M
