-----------------------------------------------------------------------
-- NeoVim config module for general settings
-----------------------------------------------------------------------

local opt = vim.opt
local g = vim.g
local o = vim.o
local cmd = vim.cmd
local api = vim.api

opt.swapfile = false -- No swap file
opt.encoding = "UTF-8" -- Encoding
opt.mouse = "a" -- Mouse support

opt.number = true -- Set line number
opt.rnu = true -- Set relative line number
opt.numberwidth = 5
opt.signcolumn = "yes"

opt.scrolloff = 8
opt.sidescroll = 8

opt.splitright = true
opt.splitbelow = true

opt.winbar = "%=%f"
opt.showmode = false

-- opt.iskeyword:append("-")

opt.hlsearch = true
opt.incsearch = true

cmd("syntax on")
o.termguicolors = true

-- Tabs & indentation
require("user.base.indent")

-- Wraps & linebreaks
require("user.base.textwidth")

-- Undotree
g.undotree_WindowLayout = 3

-- Tmux
-- vim.g.tmux_navigator_no_mappings = 1

-- highlight yanked text
api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Abbreviations
local abbrevs = require("user.base.abbrevs")
for abbrev, command in pairs(abbrevs.command) do
	cmd("cabbrev " .. abbrev .. " " .. command)
end

-- core keymaps that requires no plugins
-- leaders should be set before plugin managers
g.mapleader = "\\"
-- g.maplocalleader = " "
require("user.base.core_keymaps")

-- Optimize performance
vim.loader.enable()
