-----------------------------------------------------------------------
-- NeoVim config module for some colorscheme utilities
-----------------------------------------------------------------------

local M = {}

local color_cache_path = vim.fn.stdpath("data")
    .. package.config:sub(1, 1)
    .. "colorscheme_cache"

-- Available options
--	nightfox	duskfox				carbonfox
--	dayfox		dawnfox				terrafox
--	nordfox
--	catppuccin	catppuccin-frappe	catppuccin-mocha
--	catppuccin-macchiato			catppuccin-latte
--	kanagawa	kanagawa-dragon		kanagawa-lotus
--	kanagawa-wave
--	tokyonight	tokyonight-night	tokyonight-storm
--	tokyonight-moon					tokeyonight-day
--	onedark
--	rose-pine	rose-pine-moon		rose-pine-dawn
local default_colorscheme = "catppuccin"

M.write_colorscheme = function(colorscheme)
    vim.fn.writefile({ tostring(colorscheme) }, color_cache_path)
end

M.load_colorscheme = function()
    local exists, lines = pcall(vim.fn.readfile, color_cache_path)
    local colorscheme = default_colorscheme
    if exists and #lines > 0 and not (vim.trim(lines[1]) == "") then
        colorscheme = lines[1]
    end

    vim.cmd("colorscheme " .. colorscheme)
end

return M
