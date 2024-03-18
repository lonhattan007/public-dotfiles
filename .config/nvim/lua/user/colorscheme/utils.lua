-----------------------------------------------------------------------
-- NeoVim config module for some colorscheme utilities
-----------------------------------------------------------------------

local M = {}

local color_cache_path = vim.fn.stdpath("data")
    .. package.config:sub(1, 1)
    .. "colorscheme_cache"

local tmuxline_cache_path = vim.fn.stdpath("data")
    .. package.config:sub(1, 1)
    .. "tmuxline_cache"

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
--	onedark		everforest
--	rose-pine	rose-pine-moon		rose-pine-dawn
local default_colorscheme = "habamax"

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

M.update_tmuxline = function(colorscheme)
    if os.getenv("TMUX") then
        if string.sub(colorscheme, 1, 10) == "catppuccin" then
            vim.cmd("Tmuxline jellybeans")
        else
            vim.cmd("Tmuxline")
        end
        vim.cmd("TmuxlineSnapshot! " .. tmuxline_cache_path)
    end
end

return M
