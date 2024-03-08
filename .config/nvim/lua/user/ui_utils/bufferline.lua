-----------------------------------------------------------------------
-- NeoVim config module for bufferline
-----------------------------------------------------------------------

local bufferline_status_ok, bufferline = pcall(require, "bufferline")
if not bufferline_status_ok then
    return
end

bufferline.setup({
    options = {
        mode = "buffers", -- "tabs",
        separator_style = "thin",
        always_show_bufferline = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                separator = true,
            },
        },
    },
})

-- Bufferline icon background
-- vim.api.nvim_create_autocmd({ "BufEnter, BufNewRead" }, {
--     pattern = "*",
--     command = "highlight BufferLineDevIconLua guibg=NONE",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter, BufNewRead" }, {
--     pattern = "*",
--     command = "highlight BufferLineDevIconLuaSelected guibg=NONE",
-- })
