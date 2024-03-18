-----------------------------------------------------------------------
-- NeoVim config module for color code highlighter
-----------------------------------------------------------------------

return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        user_default_options = {
            filetypes = {
                "css",
                "scss",
                "javascript",
                "typescript",
                "jsx",
                "tsx",
                "dart",
                "toml",
                "sh",
                "dosini",
                html = { mode = "foreground" },
            },
            mode = "virtualtext",
            virtualtext = "■",
            AARRGGBB = true, -- 0xAARRGGBB hex codes
        },
    },
}
