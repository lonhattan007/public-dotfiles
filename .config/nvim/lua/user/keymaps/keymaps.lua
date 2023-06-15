-----------------------------------------------------------------------
-- NeoVim config module for key bindings
-----------------------------------------------------------------------

local cmd = vim.cmd
local wk = require("which-key")

vim.g.mapleader = "\\"

-- Which-key registered section

-- Scrolling
wk.register({
    ["<C-d>"] = { "<C-d>zz", "Scroll half page down" },
    ["<C-u>"] = { "<C-u>zz", "Scroll half page up" },
    ["<leader>j"] = { "<C-d>zz", "Scroll half page down" },
    ["<leader>k"] = { "<C-u>zz", "Scroll half page up" },
}, {
    mode = "n",
    silent = true,
    noremap = true,
})

-- Copy and cut selections
wk.register({
    ["<C-c>"] = { '"+y', "Copy selected text" },
    ["<C-x>"] = { '"+x', "Cut selected text" },
}, {
    mode = "v",
    silent = true,
    noremap = true,
})

-- Moving between buffers
wk.register({
    -- This is actually Tab
    ["<C-i>"] = { ":bn<CR>", "Move to next buffer" },
    -- And this is actually Shift + Tab
    ["<S-Tab>"] = { ":bp<CR>", "Move to previous buffer" },
}, {
    mode = "n",
    silent = true,
    noremap = true,
})

-- Move lines upwards and downwards
wk.register({
    ["<S-j>"] = { ":m '>+1<CR>gv=gv", "Move selection downward" },
    ["<S-k>"] = { ":m '<-2<CR>gv=gv", "Move selection upward" },
    ["<A-Down>"] = { ":m '>+1<CR>gv=gv", "Move selection downward" },
    ["<A-Up>"] = { ":m '<-2<CR>gv=gv", "Move selection upward" },
}, {
    mode = "v",
    silent = true,
    noremap = true,
})

-- Lock arrow keys in normal and visual mode
wk.register({
    ["<Left>"] = { "<cmd>echo 'Use H!'<CR>", "" },
    ["<Down>"] = { "<cmd>echo 'Use J!'<CR>", "" },
    ["<Up>"] = { "<cmd>echo 'Use K!'<CR>", "" },
    ["<Right>"] = { "<cmd>echo 'Use L!'<CR>", "" },
}, {
    mode = { "n", "v" },
    noremap = true,
})

-- Disable recording
wk.register({
    ["q"] = { "<Esc>", "" },
    ["Q"] = { "<Nop>", "" },
}, {
    mode = { "n", "v" },
    silent = true,
    noremap = true,
})

-- Leader prefix
wk.register({
    ["<leader>"] = {
        ["b"] = { "<cmd>Telescope file_browser<CR>", "Telescope file browser" },
        ["d"] = { "<cmd>Alpha<CR>", "Dashboard" },
        ["h"] = { "<cmd>nohl<CR>", "Turn off search highlights" },
        ["l"] = { "<cmd>Twilight<CR>", "Focus code dimming" },
        ["m"] = { "<cmd>TroubleToggle<CR>", "Toggle problems list" },
        ["o"] = { "<cmd>AerialToggle! right<CR>", "Toggle outline tree" },
        ["p"] = { "<cmd>Telescope buffers<CR>", "Telescope find open buffers" },
        ["q"] = {
            "<cmd>bp<bar>sp<bar>bn<bar>bd<bar>Alpha<CR>",
            "Toggle outline tree",
        },
        ["u"] = { "<cmd>Telescope undo<CR>", "Telescope undo" },
        ["v"] = { "<Plug>MarkdownPreviewToggle", "Toggle markdown preview" },
        -- ["w"] = { "<cmd>W<CR>", "Turn on which-key manual" },
        ["w"] = { "<cmd>bw<CR>", "Close buffer" },
        -- ["x"] = { "<cmd>TransparentToggle<CR>", "Toggle transparency" },
        ["z"] = { "<cmd>ZenMode<CR>", "Toggle zen mode" },
    },
})

-- NvimTree
wk.register({
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
}, {
    mode = { "n", "v" },
    silent = true,
    noremap = true,
})

wk.register({
    ["<C-e>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
}, {
    mode = { "i" },
    silent = true,
    noremap = true,
})

-- Floating terminal
wk.register({
    ["<leader>`"] = { "<cmd>ToggleTerm<CR>", "Toggle terminal" },
}, {
    mode = { "n", "v", "t" },
    silent = true,
    noremap = true,
})

-- Telescope and its extensions
wk.register({
    -- Flutter
    ["f"] = {
        name = "Flutter commands",
        ["c"] = {
            "<cmd>Telescope flutter commands<CR>",
            "Telescope flutter commands",
        },
        ["d"] = { "<cmd>FlutterDevices<CR>", "Choose Flutter device" },
        ["e"] = { "<cmd>FlutterEmulators<CR>", "Choose Flutter emulator" },
        ["o"] = {
            "<cmd>FlutterOutlineToggle<CR>",
            "Toggle Flutter widgets outline pane",
        },
    },
    -- Telescope utils
    ["t"] = {
        name = "Telescope utils",
        ["a"] = { "<cmd>Telescope aerial<CR>", "Telescope outline tree" },
        ["b"] = { "<cmd>Telescope buffers<CR>", "Telescope find open buffers" },
        ["c"] = { "<cmd>Telescope colorscheme<CR>", "Telescope colorscheme" },
        ["d"] = { "<cmd>Telescope diagnostics<CR>", "Telescope diagnostics" },
        ["f"] = { "<cmd>Telescope find_files<CR>", "Telescope find files" },
        ["h"] = { "<cmd>Telescope help_tags<CR>", "Vim manuals" },
        ["k"] = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
        ["l"] = { "<cmd>Telescope<CR>", "Telescope builtins" },
        ["o"] = { "<cmd>Telescope aerial<CR>", "Telescope outline" },
        ["p"] = { "<cmd>Telescope projects<CR>", "Telescope projects" },
        ["u"] = { "<cmd>Telescope undo<CR>", "Telescope undo" },
        ["z"] = {
            "<cmd>Telescope current_buffer_fuzzy_find<CR>",
            "Telescope fuzzy find",
        },
    },
}, { prefix = "<leader>" })

-- Panes and Tmux motion integration
wk.register({
    ["s"] = {
        name = "Working with panes",
        ["s"] = { "<cmd>split<CR>", "Split horizontally" },
        ["v"] = { "<cmd>vsplit<CR>", "Split vertically" },
        ["h"] = { "<cmd>TmuxNavigateLeft<CR>", "Focus on left pane" },
        ["j"] = { "<cmd>TmuxNavigateDown<CR>", "Focus on upper pane" },
        ["k"] = { "<cmd>TmuxNavigateUp<CR>", "Focus on right pane" },
        ["l"] = { "<cmd>TmuxNavigateRight<CR>", "Focus on lower pane" },
        ["H"] = { "<C-w>H<Esc>", "Move the focused pane to the far left" },
        ["J"] = { "<C-w>J<Esc>", "Move the focused pane the far bottom" },
        ["K"] = { "<C-w>K<Esc>", "Move the focused pane to the far top" },
        ["L"] = { "<C-w>L<Esc>", "Move the focused pane to the far right" },
        ["T"] = { "<C-w>T<Esc>", "Move the focused pane to a new tab" },
        ["<Up>"] = { "<C-w>+<CR>", "Vertically increase the focused pane size" },
        ["<Down>"] = {
            "<C-w>-<CR>",
            "Vertically decrease the focused pane size",
        },
        ["<Left>"] = {
            "<C-w><<CR>",
            "Horizontally decrease the focused pane size",
        },
        ["<Right>"] = {
            "<C-w>><CR>",
            "Horizontally increase the focused pane size",
        },
        ["="] = { "<C-w>=<CR>", "Equalize split sizes" },
    },
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Tmux navigate left" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Tmux navigate down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Tmux navigate up" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Tmux navigate right" },
})

-- Comment
wk.register({
    ["<C-_>"] = {
        "<Plug>(comment_toggle_linewise_current)",
        "Toggle line comment",
    },
    ["<C-/>"] = {
        "<Plug>(comment_toggle_linewise_current)",
        "Toggle line comment",
    },
}, {
    mode = { "n" },
    silent = true,
    noremap = true,
})
wk.register({
    ["<C-_>"] = {
        "<cmd>lua require('Comment.api').toggle.linewise()<CR>",
        "Toggle line comment",
    },
    ["<C-/>"] = {
        "<cmd>lua require('Comment.api').toggle.linewise()<CR>",
        "Toggle line comment",
    },
}, {
    mode = { "i" },
    silent = true,
    noremap = true,
})
wk.register({
    ["<C-_>"] = {
        "<Plug>(comment_toggle_linewise_visual)",
        "Toggle line comment",
    },
    ["<C-/>"] = {
        "<Plug>(comment_toggle_linewise_visual)",
        "Toggle line comment",
    },
}, {
    mode = { "x" },
})

-- Abbreviations for Vim-Plug
cmd("cabb PI PlugInstall")
cmd("cabb PU PlugUpdate")
cmd("cabb PC PlugClean")
-- Abbreviations for Telescope
cmd("cabb TL Telescope")
-- Abbreviations for LSP information
cmd("cabb LI LspInfo")
cmd("cabb NI NullLsInfo")
-- Abbreviations for saving
cmd("cabb W w")
-- Abbreviations for WhickKey
cmd("cabb ? WhichKey")
