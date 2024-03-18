-----------------------------------------------------------------------
-- NeoVim config module for Telescope fuzzy finder
-----------------------------------------------------------------------

return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope_status_ok, telescope = pcall(require, "telescope")
			if not telescope_status_ok then
				return
			end

			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			local function toggle_selection_next(_prompt_bufnr)
				actions.toggle_selection(_prompt_bufnr)
				actions.move_selection_next(_prompt_bufnr)
			end

			local function toggle_selection_prev(_prompt_bufnr)
				actions.toggle_selection(_prompt_bufnr)
				actions.move_selection_previous(_prompt_bufnr)
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
							["s"] = actions.toggle_selection,
							["<A-s>"] = actions.toggle_all,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["<A-j>"] = toggle_selection_next,
							["<A-k>"] = toggle_selection_prev,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
						["i"] = {
							["<C-t>"] = actions.select_tab,
							["<C-s>"] = actions.toggle_selection,
							["A-s"] = actions.toggle_all,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["<A-j>"] = toggle_selection_next,
							["<A-k>"] = toggle_selection_prev,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
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
					colorscheme = {
						initial_mode = "insert",
					},
					oldfiles = {
						initial_mode = "normal",
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
					live_grep = {
						initial_mode = "insert",
					},
					current_buffer_fuzzy_find = {
						initial_mode = "insert",
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						initial_mode = "insert",
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
								["<C-c>"] = fb_actions.change_cwd,
								["<F2>"] = fb_actions.rename,
							},
							["i"] = {
								["<C-a>"] = fb_actions.create,
								["<C-c>"] = fb_actions.create,
								["<C-r>"] = fb_actions.rename,
								["<F2>"] = fb_actions.rename,
								["<S-Del>"] = fb_actions.remove,
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
			telescope.load_extension("projects")
			telescope.load_extension("flutter")

			-- TODO: Switch between find_files and git_files based on directory
			-- local function file_finder()
			-- 	local utils = require("telescope.utils")
			-- 	local builtin = require("telescope.builtin")
			-- 	local _, ret, _ = utils.get_os_command_output({
			-- 		"git",
			-- 		"rev-parse",
			-- 		"--is-inside-work-tree",
			-- 	})
			-- 	if ret == 0 then
			-- 		builtin.git_files()
			-- 	else
			-- 		builtin.find_files()
			-- 	end
			-- end
			--
			-- local opts = { noremap = true, silent = true, desc = "File finder" }
			-- vim.keymap.set("n", "<C-p>", file_finder, opts)
		end,
	},
}
