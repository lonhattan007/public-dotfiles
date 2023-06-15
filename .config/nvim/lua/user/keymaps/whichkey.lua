-----------------------------------------------------------------------
-- NeoVim config module for key bindings recognizer
-----------------------------------------------------------------------

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
    return
end

wk.setup({
    plugins = {
        -- shows a list of your marks on ' and `
        marks = true,
        -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        registers = true,
        spelling = {
            -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            enabled = false,
            -- how many suggestions should be shown in the list?
            suggestions = 20,
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            -- adds help for operators like d, y, ... and registers them for motion / text object completion
            operators = true,
            -- adds help for motions
            motions = true,
            -- help for text objects triggered after entering an operator
            text_objects = true,
            -- default bindings on <c-w>
            windows = true,
            -- misc bindings to work with windows
            nav = true,
            -- bindings for folds, spelling and others prefixed with z
            z = true,
            -- bindings for prefixed with g
            g = false,
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        -- symbol used in the command line area that shows your active key combo
        breadcrumb = "»",
        -- symbol used between a key and it's label
        separator = "➜",
        -- symbol prepended to a group
        group = "+",
    },
    popup_mappings = {
        -- binding to scroll down inside the popup
        scroll_down = "<c-d>",
        -- binding to scroll up inside the popup
        scroll_up = "<c-u>",
    },
    window = {
        -- none, single, double, shadow
        border = "none",
        -- bottom, top
        position = "bottom",
        -- extra window margin [top, right, bottom, left]
        margin = { 1, 0, 1, 0 },
        -- extra window padding [top, right, bottom, left]
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },
    layout = {
        -- min and max height of the columns
        height = { min = 4, max = 25 },
        -- min and max width of the columns
        width = { min = 20, max = 50 },
        -- spacing between columns
        spacing = 3,
        -- align columns left, center or right
        align = "left",
    },
    -- enable this to hide mappings for which you didn't specify a label
    ignore_missing = false,
    -- hide mapping boilerplate
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    -- show help message on the command line when the popup is visible
    show_help = true,
    -- show the currently pressed key and its label as a message in the command line
    show_keys = true,
    -- automatically setup triggers
    triggers = "auto",
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
})
