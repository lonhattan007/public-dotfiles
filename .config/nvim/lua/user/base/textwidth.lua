-----------------------------------------------------------------------
-- NeoVim config module for text-wrapping different filetypes
-----------------------------------------------------------------------

local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

opt.wrap = false
opt.linebreak = true

-- api.nvim_create_autocmd("FileType", {
-- 	pattern = {
-- 		"tex",
-- 	},
-- 	callback = function()
-- 		cmd("set textwidth=120")
-- 		-- colorcolumn right after textwidth
-- 		cmd("set colorcolumn=+1")
-- 	end,
-- })

api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
    pattern = {
        "*.tex",
    },
    callback = function()
        cmd("setlocal textwidth=120")
        cmd("setlocal colorcolumn=+1")
    end,
})
