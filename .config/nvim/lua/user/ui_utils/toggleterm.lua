-----------------------------------------------------------------------
-- NeoVim config module for integrated terminal
-----------------------------------------------------------------------

return {
    "akinsho/toggleterm.nvim",
    opts = {
        direction = "float",
        float_opts = {
            border = "curved",
        },
        persist_mode = true, -- always in terminal mode when open
        shell = function()
            if package.config:sub(1, 1) == "\\" then
                return "pwsh.exe -NoLogo"
            else
                return vim.o.shell
            end
        end,
    },
}
