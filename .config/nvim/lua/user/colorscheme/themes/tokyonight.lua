-----------------------------------------------------------------------
-- NeoVim config module for Tokyo Night colorscheme
-----------------------------------------------------------------------

local tokyo_night_status_ok, tokyo_night = pcall(require, "tokyonight")
if not tokyo_night_status_ok then
    return
end

tokyo_night.setup({
    style = "storm",
    light_style = "day",
    transparent = vim.g.transparent_enabled,
    terminal_colors = false,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = true },
        variables = { italic = true },
        sidebars = "transparent",
        floats = "transparent",
    },
    sidebars = { "aerial", "help", "qf" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
})
