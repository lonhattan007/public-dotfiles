-- This is my Neovim and Neovide configuration file

require("user.plugins") -- Plugins installation
require("user.settings") -- General settings

-- Keymaps
require("user.keymaps")

-- UI and interactive utilities: file browser, terminal, etc.
require("user.ui_utils")

-- LSP related utilities
require("user.lsp")

-- Colorscheme and syntax highlighting
require("user.colorscheme")

-- Code-support utilities: completions, auto-pair-and-close, zen mode, etc.
require("user.code_utils")

-- Neovide
if vim.g.neovide then
    require("user.neovide")
end
