-----------------------------------------------------------------------
-- NeoVim config module for core key bindings that requires no plugins
-----------------------------------------------------------------------

local keymap = vim.keymap.set

-- Scrolling
keymap({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Scroll half page down" })
keymap({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Scroll half page up" })
keymap({ "n", "v" }, "<C-f>", "<C-f>zz", { desc = "Scroll full page down" })
keymap({ "n", "v" }, "<C-b>", "<C-b>zz", { desc = "Scroll full page up" })
keymap({ "n", "v" }, "<A-j>", "<C-d>zz", { desc = "Scroll half page down" })
keymap({ "n", "v" }, "<A-k>", "<C-u>zz", { desc = "Scroll half page up" })
keymap({ "n", "v" }, "<A-h>", "8zh", { desc = "Scroll right" })
keymap({ "n", "v" }, "<A-l>", "8zl", { desc = "Scroll left" })

-- Quick move and delete words in insert mode
-- This is Ctrl + backspace
keymap("i", "<C-H>", "<C-o>db<Esc>xa", { desc = "Deleted word before cursor" })
keymap("i", "<C-BS>", "<C-o>db<Esc>xa", { desc = "Deleted word before cursor" })
keymap("i", "<C-Del>", "<C-o>de", { desc = "Deleted word after cursor" })
keymap("i", "<C-Left>", "<C-o>b", { desc = "Move to previous word" })
-- keymap("i", "<C-Right>", "<Esc>Ea", { desc = "Move to next word" })
keymap("i", "<C-Right>", "<C-o>e<Right>", { desc = "Move to next word" })

-- Select all
keymap({ "n", "v", "i" }, "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Copy and cut selections
keymap("v", "<C-c>", '"+y', { desc = "Copy selected text" })
keymap("v", "<C-x>", '"+x', { desc = "Cut selected text" })

-- Moving between buffers and tabs
-- In normal mode, use "<c-i>" is for Tab and "<s-tab>" for Shift + Tab
keymap("n", "]b", ":bn<CR>", { desc = "move to next buffer" })
keymap("n", "[b", ":bp<CR>", { desc = "move to previous buffer" })
keymap("n", "[t", ":tabprevious<CR>", { desc = "move to previous tab" })
keymap("n", "]t", ":tabnext<CR>", { desc = "move to next tab" })

-- Move lines upwards and downwards
keymap("v", "<S-j>", ":m '>+1<CR>ggv=gv", { desc = "move selection downward" })
keymap("v", "<S-k>", ":m '<-2<CR>ggv=gv", { desc = "move selection upward" })
keymap("v", "<A-down>", ":m '>+1<CR>ggv=gv", { desc = "move selection downward" })
keymap("v", "<A-up>", ":m '<-2<CR>ggv=gv", { desc = "move selection upward" })

-- Lock arrow keys in normal and visual mode
keymap({ "n", "v" }, "<Left>", "<cmd>echo 'Use h!'<CR>g")
keymap({ "n", "v" }, "<Down>", "<cmd>echo 'Use j!'<CR>g")
keymap({ "n", "v" }, "<Up>", "<cmd>echo 'Use k!'<CR>g")
keymap({ "n", "v" }, "<Right>", "<cmd>echo 'Use l!'<CR>g")

-- Disable recording
keymap({ "n", "v" }, "q", "<nop>")

-- Redo
keymap({ "n", "v" }, "<S-u>", "<cmd>redo<CR>", { desc = "redo" })

-- Toggle relative line numbers
keymap({ "n", "v", "i" }, "<C-r>", "<cmd>set rnu!<CR>", { desc = "Toggle relative line numbers" })

-- Turn off search highlights
keymap("n", "<leader>n", "<cmd>:nohl<CR>", { desc = "Turn off search highlight" })

-- Working with panes and buffers
keymap("n", "<space>s", "<cmd>split<CR>", { desc = "Split horizontally" })
keymap("n", "<space>v", "<cmd>vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<space>h", "<C-w>h<Esc>", { desc = "Focus on left pane" })
keymap("n", "<space>j", "<C-w>j<Esc>", { desc = "Focus on upper pane" })
keymap("n", "<space>k", "<C-w>k<Esc>", { desc = "Focus on right pan)" })
keymap("n", "<space>l", "<C-w>l<Esc>", { desc = "Focus on lower pane" })
keymap("n", "<space>q", "<C-w>q<Esc>", { desc = "Close pane" })
keymap("n", "<space>w", "<cmd>bw<CR>", { desc = "Close buffer" })
keymap("n", "<space>H", "<C-w>H<Esc>", { desc = "Move the focused pane to the far left" })
keymap("n", "<space>J", "<C-w>J<Esc>", { desc = "Move the focused pane the far bottom" })
keymap("n", "<space>K", "<C-w>K<Esc>", { desc = "Move the focused pane to the far top" })
keymap("n", "<space>L", "<C-w>L<Esc>", { desc = "Move the focused pane to the far right" })
keymap("n", "<space>T", "<C-w>T<Esc>", { desc = "Move the focused pane to a new tab" })
keymap("n", "<space><Up>", "<C-w>+<CR>", { desc = "Vertically increase the focused pane size" })
keymap("n", "<space><Down>", "<C-w>-<CR>", { desc = "Vertically decrease the focused pane size" })
keymap("n", "<space><Left>", "<C-w><<CR>", { desc = "Horizontally decrease the focused pane size" })
keymap("n", "<space><Right>", "<C-w>><CR>", { desc = "Horizontally increase the focused pane size" })
keymap("n", "<space>=", "<C-w>=<CR>", { desc = "Equalize split sizes" })
keymap("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<bar>Alpha<CR>", { desc = "Exit to dashboard" })