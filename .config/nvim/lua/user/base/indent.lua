------------------------------------------------------------------------
-- NeoVim config module for indenting in different filetypes
-----------------------------------------------------------------------

local opt = vim.opt
local opt_local = vim.opt_local
local api = vim.api

opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
    pattern = {
        "*.c",
        "*.cpp",
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
        "*.org",
        "*.tex",
        "*.bib",
    },
    callback = function()
        opt_local.tabstop = 2
        opt_local.shiftwidth = 2
    end,
})

api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
    pattern = {
        "*.py",
        "*.lua",
        "*.kt",
        "*.go",
        "*.rs",
    },
    callback = function()
        opt_local.tabstop = 4
        opt_local.tabstop = 4
    end,
})

vim.g.editorconfig = true
