-----------------------------------------------------------------------
-- NeoVim config module for status line
-----------------------------------------------------------------------

local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
    return
end

lualine.setup({
    options = {
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "branch",
                icons_enabled = true,
                icon = "",
            },
        },
        lualine_c = {
            {
                "filetype",
                icon_only = true,
                -- icon = { align = "left" },
                separator = { right = nil },
                padding = { left = 1, right = 0 },
            },
            {
                "filename",
                file_status = true, -- readonly, modified, ...
                path = 0, -- 0: just filename, 1: relative path, 2: absolutepath
                separator = { left = nil },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
            },
            "encoding",
            "fileformat",
            -- "os.date('%H:%M')",
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    extensions = {
        "aerial",
        "nerdtree",
        "nvim-tree",
        "fugitive",
        "toggleterm",
    },
})
