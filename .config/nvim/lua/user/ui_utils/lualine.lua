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
        component_separators = { left = "|", right = "|" },
        -- { left = '', right = ''},
        -- { left = '', right = '' },
        section_separators = { left = "", right = " " },
        -- { left = "", right = "" },
        -- { left = '', right = '' },
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
                colored = false,
                -- icon = { align = "left" },
                separator = { right = nil },
                padding = { left = 1, right = 0 },
            },
            {
                "filename",
                file_status = true, -- readonly, modified, ...
                path = 0, -- 0: filename, 1: relative path, 2: absolute path
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
        lualine_y = {
            {
                "location",
                padding = { left = 2, right = 1 },
                fmt = function(str)
                    local output = ""
                    for token in string.gmatch(str, "[^:]+") do
                        output = output .. string.format("%02d", token) .. ":"
                    end
                    return output:sub(1, -2)
                end,
            },
        },
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
