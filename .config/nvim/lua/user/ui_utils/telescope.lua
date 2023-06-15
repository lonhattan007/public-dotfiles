-----------------------------------------------------------------------
-- NeoVim config module for Telescope fuzzy finder
-----------------------------------------------------------------------

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end

local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        initial_mode = "normal",
        mappings = {
            ["n"] = {
                ["q"] = actions.close,
                ["t"] = actions.select_tab,
            },
            ["i"] = {
                ["<C-t>"] = actions.select_tab,
            },
        },
    },
    pickers = {
        lsp_references = {
            theme = "dropdown",
            initial_mode = "normal",
        },
        builtin = {
            initial_mode = "normal",
        },
        buffers = {
            initial_mode = "normal",
        },
        oldfiles = {
            initial_mode = "normal",
        },
        colorscheme = {
            initial_mode = "insert",
        },
        find_files = {
            initial_mode = "insert",
        },
        git_files = {
            initial_mode = "insert",
        },
        help_tags = {
            theme = "dropdown",
            initial_mode = "insert",
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            initial_mode = "normal",
            path = "%:p:h",
            hidden = true,
            dir_icon = "",
            git_status = true,
            cwd = telescope_buffer_dir(),
            mappings = {
                ["n"] = {
                    ["a"] = fb_actions.create,
                    ["<C-n>"] = fb_actions.create,
                    ["t"] = actions.select_tab,
                    ["<C-t>"] = actions.select_tab,
                    ["<c>"] = fb_actions.change_cwd,
                },
            },
        },
        aerial = {
            show_nesting = {
                ["_"] = false,
                json = true,
                yaml = true,
            },
        },
        undo = {
            use_delta = true,
            side_by_side = false,
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            initial_mode = "normal",
            layout_strategy = "vertical",
            layout_config = {
                vertical = {
                    preview_cutoff = 0,
                },
                height = 0.95,
                preview_height = 0.6,
            },
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("aerial")
telescope.load_extension("undo")
telescope.load_extension("flutter")

-- Switch between find_files and git_files based on directory
local function file_finder()
    local utils = require("telescope.utils")
    local builtin = require("telescope.builtin")
    local _, ret, _ = utils.get_os_command_output({
        "git",
        "rev-parse",
        "--is-inside-work-tree",
    })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

local opts = { noremap = true, silent = true, desc = "File finder" }
vim.keymap.set("n", "<C-p>", file_finder, opts)
