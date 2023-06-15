-----------------------------------------------------------------------
-- NeoVim config module for virtual text highlighting on whitespaces
-----------------------------------------------------------------------

local indent_status_ok, indent_blankline = pcall(require, "indent_blankline")
if not indent_status_ok then
    return
end

vim.opt.list = true
vim.opt.termguicolors = true

indent_blankline.setup({
    show_current_context = true,
    -- show_current_context_start = true,
})
