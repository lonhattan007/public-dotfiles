-----------------------------------------------------------------------
-- NeoVim config module for Neovide
-----------------------------------------------------------------------

vim.opt.guifont = "Jetbrains Mono:h13"
vim.g.neovide_transparency = 0.9

local session = os.getenv("DESKTOP_SESSION")
if session == "bspwm" then
    vim.g.neovide_scale_factor = 0.8
else
    vim.g.neovide_scale_factor = 1.0
end

local function neovide_zoom_in()
    if vim.g.neovide_scale_factor < 2.0 then
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
    end
end

local function neovide_zoom_out()
    if vim.g.neovide_scale_factor > 0.1 then
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
    end
end

require("which-key").register({
    ["<C-=>"] = { neovide_zoom_in, "Zoom in" },
    ["<C-->"] = { neovide_zoom_out, "Zoom out" },
}, {
    mode = { "n", "v", "i" },
    silent = true,
    noremap = true,
})
