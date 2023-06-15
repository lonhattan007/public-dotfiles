-----------------------------------------------------------------------
-- NeoVim config module for integrated terminal
-----------------------------------------------------------------------

local toggle_term_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggle_term_status_ok then
    return
end

toggleterm.setup({
    direction = "float",
    float_opts = {
        border = "curved",
    },
    persist_mode = true, -- always in terminal mode when open
})
