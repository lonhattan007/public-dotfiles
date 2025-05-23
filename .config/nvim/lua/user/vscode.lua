-----------------------------------------------------------------------
-- NeoVim config module for integration inside VSCode
-----------------------------------------------------------------------

local opt = vim.opt
local g = vim.g
local o = vim.o
local cmd = vim.cmd
local api = vim.api

opt.swapfile = false -- No swap file
opt.encoding = "UTF-8" -- Encoding

opt.number = true -- Set line number
opt.rnu = true -- Set relative line number

opt.scrolloff = 8
opt.sidescroll = 8

opt.splitright = true
opt.splitbelow = true

-- opt.iskeyword:append("-")

opt.hlsearch = true
opt.incsearch = true

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
local keymap = vim.keymap.set

-- leaders should be set before plugin managers
g.mapleader = "\\"

-- Copy and cut selections
-- keymap("v", "<C-c>", "<cmd>lua require('vscode').call('editor.action.clipboardCopyAction')<CR><Esc>", { desc = "Copy selected text" })
-- keymap("v", "<C-x>", "<cmd>lua require('vscode').call('editor.action.clipboardCutAction')<CR><Esc>", { desc = "Cut selected text" })

-- Moving between buffers and tabs
vim.cmd("nmap <space>n gt")
vim.cmd("nmap <space>p gT")
vim.cmd("nmap ]b gt")
vim.cmd("nmap [b gT")
vim.cmd("nmap ]t gt")
vim.cmd("nmap [t gT")

-- LSPs
vim.cmd('nmap ]d <cmd>lua require("vscode").call("editor.action.marker.next")<CR>')
vim.cmd('nmap [d <cmd>lua require("vscode").call("editor.action.marker.prev")<CR>')
vim.cmd('nmap <leader>ca <cmd>lua require("vscode").call("editor.action.quickFix")<CR>')

-- Move lines upwards and downwards
keymap(
	"v",
	"<S-j>",
	"<cmd>lua require('vscode').call('editor.action.moveLinesDownAction')<CR>",
	{ desc = "move selection downward" }
)
keymap(
	"v",
	"<S-k>",
	"<cmd>lua require('vscode').call('editor.action.moveLinesUpAction')<CR>",
	{ desc = "move selection upward" }
)
keymap(
	"v",
	"<A-down>",
	"<cmd>lua require('vscode').call('editor.action.moveLinesDownAction')<CR>",
	{ desc = "move selection downward" }
)
keymap(
	"v",
	"<A-up>",
	"<cmd>lua require('vscode').call('editor.action.moveLinesUpAction')<CR>",
	{ desc = "move selection upward" }
)

-- Change recording keymap
-- keymap({ "n", "v" }, "<leader>q", "q", { desc = "Record macro", noremap = true })
-- keymap({ "n", "v" }, "q", "<nop>", { noremap = true })

-- Redo
keymap({ "n", "v" }, "<S-u>", "<cmd>redo<CR>", { desc = "redo" })

-- Toggle relative line numbers
keymap({ "n", "v", "i" }, "<C-r>", "<cmd>set rnu!<CR>", { desc = "Toggle relative line numbers" })

-- Turn off search highlights
keymap("n", "<leader>n", "<cmd>:nohl<CR>", { desc = "Turn off search highlight" })

-- Working with panes and buffers
keymap(
	"n",
	"<Space>s",
	"<cmd>lua require('vscode').call('workbench.action.splitEditorToRightGroup')<CR>",
	{ desc = "Split horizontally" }
)
keymap(
	"n",
	"<Space>v",
	"<cmd>lua require('vscode').call('workbench.action.splitEditorToBelowGroup')<CR>",
	{ desc = "Split vertically" }
)
keymap(
	"n",
	"<Space>h",
	"<cmd>lua require('vscode').call('workbench.action.focusLeftGroup')<CR>",
	{ desc = "Focus on left pane" }
)
keymap(
	"n",
	"<Space>j",
	"<cmd>lua require('vscode').call('workbench.action.focusBelowGroup')<CR>",
	{ desc = "Focus on upper pane" }
)
keymap(
	"n",
	"<Space>k",
	"<cmd>lua require('vscode').call('workbench.action.focusAboveGroup')<CR>",
	{ desc = "Focus on right pane" }
)
keymap(
	"n",
	"<Space>l",
	"<cmd>lua require('vscode').call('workbench.action.focusRightGroup')<CR>",
	{ desc = "Focus on lower pane" }
)
keymap(
	"n",
	"<Space>w",
	"<cmd>lua require('vscode').call('workbench.action.closeActiveEditor')<CR>",
	{ desc = "Close pane" }
)
keymap(
	"n",
	"<space><Up>",
	"<cmd>lua require('vscode').call('workbench.action.increaseViewHeight')<CR>",
	{ desc = "Increase pane height" }
)
keymap(
	"n",
	"<space><Down>",
	"<cmd>lua require('vscode').call('workbench.action.decreaseViewHeight')<CR>",
	{ desc = "Decrease pane height" }
)
keymap(
	"n",
	"<space><Left>",
	"<cmd>lua require('vscode').call('workbench.action.decreaseViewWidth')<CR>",
	{ desc = "Decrease pane width" }
)
keymap(
	"n",
	"<space><Right>",
	"<cmd>lua require('vscode').call('workbench.action.increaseViewWidth')<CR>",
	{ desc = "Increase pane width" }
)

-- code inspection & LSP
keymap(
	"n",
	"<S-k>",
	"<cmd>lua require('vscode').call('editor.action.showHover')<CR>",
	{ desc = "Hover document", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>i",
	"<cmd>lua require('vscode').call('editor.action.formatDocument')<CR>",
	{ desc = "Format document", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>r",
	"<cmd>lua require('vscode').call('editor.action.rename')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)

-- zenmode
keymap(
	"n",
	"<leader>z",
	"<cmd>lua require('vscode').call('workbench.action.toggleZenMode')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)

-- workspace
keymap(
	"n",
	"<leader>`",
	"<cmd>lua require('vscode').call('workbench.action.terminal.toggleTerminal')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>e",
	"<cmd>lua require('vscode').call('workbench.view.explorer')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>b",
	"<cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>p",
	"<cmd>lua require('vscode').call('workbench.action.quickOpen')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>sc",
	"<cmd>lua require('vscode').call('workbench.action.selectTheme')<CR>",
	{ desc = "Toggle Zen mode", silent = true, noremap = true }
)
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementations", silent = true, noremap = true })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references", silent = true, noremap = true })
keymap("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition", silent = true, noremap = true })
vim.cmd([[
	nmap gv <C-w>v<Esc>gd
	nmap gs <C-w>s<Esc>gd
]])
