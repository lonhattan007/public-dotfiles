-----------------------------------------------------------------------
-- NeoVim config module for markdown preview
-----------------------------------------------------------------------

return {
    "epwalsh/obsidian.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    ft = { "markdown", "vim-lug", "vim", "lua" },
    config = function()
        local obsidian_util = require("obsidian.util")

        local function get_templates_path()
            if obsidian_util.get_os() == obsidian_util.OSType.Wsl then
                return nil
            else
                return "Templates"
            end
        end

        require("obsidian").setup({
            workspaces = {
                {
                    name = "DevNotes",
                    path = "~/ObsidianVaults/DevNotes",
                    overrides = {
                        templates = {
                            subdir = get_templates_path(),
                        },
                    },
                },
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2,
                -- new_notes_location = "current_dir",
                -- prepend_note_id = false,
                -- prepend_note_path = false,
                use_path_only = true,
            },
            new_notes_location = "current_dir",
            wiki_link_func = function(opts)
                if opts.id == nil then
                    return string.format("[[%s]]", opts.label)
                elseif opts.label ~= opts.id then
                    return string.format("[[%s|%s]]", opts.id, opts.label)
                else
                    return string.format("[[%s]]", opts.id)
                end
            end,
            mappings = {},
            ui = {
                enable = false,
            },
        })
    end,
}
