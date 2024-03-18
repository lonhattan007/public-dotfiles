-----------------------------------------------------------------------
-- NeoVim config module for Neovide
-----------------------------------------------------------------------

if vim.g.neovide then
    -- UI settings
    vim.opt.guifont = "JetbrainsMono Nerd Font:h11"

    -- Transparency, set to disabled to be easily distinguished from terminal nvim
    vim.g.neovide_transparency = 0.8
    vim.cmd("TransparentDisable")

    vim.api.nvim_create_autocmd("ExitPre", {
        callback = function()
            vim.cmd("TransparentEnable")
        end,
    })

    -- Scaling
    local session = os.getenv("DESKTOP_SESSION")
    if session == "bspwm" then
        vim.g.neovide_scale_factor = 0.6
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

    -- Some neovide-only keymaps
    local wk = require("which-key")
    wk.register({
        -- Using modkeys results in slow response time in window
        -- Do I have to use leader key instead
        ["<leader>="] = { neovide_zoom_in, "Zoom in" },
        ["<leader>-"] = { neovide_zoom_out, "Zoom out" },
    }, {
        mode = { "n", "v", "i" },
        silent = true,
        noremap = true,
    })
    wk.register({
        ["<C-v>"] = { '<Esc>"+pa', "Paste from clipboard" },
    }, { mode = { "i" }, silent = true, noremap = true })
    wk.register({
        ["<C-S-v>"] = { '"+p', "Paste from clipboard" },
    }, { mode = { "n" }, silent = true, noremap = true })
end
