------------------------------------------------------------------------
-- NeoVim config module for indenting in different filetypes
-----------------------------------------------------------------------

local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

opt.tabstop = 4
opt.shiftwidth = 4

cmd("set autoindent")

-- api.nvim_create_autocmd("FileType", {
-- 	pattern = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"javascript.jsx",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"typescript.tsx",
-- 	},
-- 	callback = function()
-- 		cmd("set tabstop=2")
-- 		cmd("set shiftwidth=2")
-- 	end,
-- })

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
		cmd("setlocal tabstop=2")
		cmd("setlocal shiftwidth=2")
	end,
})

-- api.nvim_create_autocmd("FileType", {
-- 	pattern = { "markdown" },
-- 	callback = function()
-- 		cmd("set conceallevel=1")
-- 	end,
-- })

-- api.nvim_create_autocmd("FileType", {
--     pattern = {
--         "lua",
--         "py",
--     },
--     callback = function()
--         cmd("set tabstop=4")
--         cmd("set shiftwidth=4")
--         cmd("echo 'Tab 4 loaded via FileType'")
--     end,
-- })

api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
	pattern = {
		"*.py",
		"*.lua",
		"*.kt",
		"*.go",
		"*.rs",
	},
	callback = function()
		cmd("setlocal tabstop=4")
		cmd("setlocal shiftwidth=4")
		-- cmd("echo 'Tab 4 loaded via BufNewFile'")
	end,
})

vim.g.editorconfig = true
