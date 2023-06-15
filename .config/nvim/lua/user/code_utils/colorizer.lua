-----------------------------------------------------------------------
-- NeoVim config module for color code highlighter
-----------------------------------------------------------------------

local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
    return
end

colorizer.setup({
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
    html = {
        mode = "foreground",
    },
    dart = {
        rgb_0x = true, -- enable parsing "0xAARRGGBB"
    },
})
