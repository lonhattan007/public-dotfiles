-----------------------------------------------------------------------
-- NeoVim config module for general settings
-----------------------------------------------------------------------

local opt = vim.opt
-- local g = vim.g
-- local o = vim.o
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

opt.splitright = true
opt.splitbelow = true
-- opt.winbar = "%=%f"

opt.iskeyword:append("-")

opt.hlsearch = true
opt.incsearch = true

-- 4-space tabbing
opt.tabstop = 4
opt.shiftwidth = 4

-- Indentation
cmd("set autoindent")
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = {
        "*.html",
        "*.css",
        "*.scss",
        "*.less",
        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",
        "*.json",
        "*.yaml",
        "*.toml",
        "*.dart",
        "*.md",
        "*.tex",
        "*.org",
    },
    command = "set tabstop=2 | "
        .. "set softtabstop=0 noexpandtab | "
        .. "set shiftwidth=2",
})

api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = {
        "*.kt",
        "*.java",
    },
    command = "set tabstop=4 | "
        .. "set softtabstop=0 noexpandtab | "
        .. "set shiftwidth=4",
})

-- Undotree
vim.g.undotree_WindowLayout = 3

-- Tmux
vim.g.tmux_navigator_no_mappings = 1

-- Optimize performance
vim.loader.enable()
