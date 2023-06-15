-----------------------------------------------------------------------
-- NeoVim config module for auto close tags
-----------------------------------------------------------------------

local autotag_status_ok, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_status_ok then
    return
end

local filetypes = {
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "tsx",
    "jsx",
    "rescript",
    "xml",
    "php",
    "markdown",
    "glimmer",
    "handlebars",
    "hbs",
}

autotag.setup({
    enable = true,
    filetypes = filetypes,
})
