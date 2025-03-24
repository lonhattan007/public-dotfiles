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
		branch = "master",
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
					initial_mode = "insert",
					mappings = {
						["n"] = {
							["d"] = false,
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
							["<C-h>"] = actions.preview_scrolling_left,
							["<C-l>"] = actions.preview_scrolling_right,
							["<M-[>"] = actions.results_scrolling_left,
							["<M-]>"] = actions.results_scrolling_right,
						},
						["i"] = {
							["<C-t>"] = actions.select_tab,
							["<C-s>"] = actions.toggle_selection,
							["<A-s>"] = actions.toggle_all,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
							["<A-j>"] = toggle_selection_next,
							["<A-k>"] = toggle_selection_prev,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
							["<C-h>"] = actions.preview_scrolling_left,
							["<C-l>"] = actions.preview_scrolling_right,
							["<M-[>"] = actions.results_scrolling_left,
							["<M-]>"] = actions.results_scrolling_right,
						},
					},
				},
				pickers = {
					buffers = {
						initial_mode = "insert",
						mappings = {
							["n"] = {
								["<S-Del>"] = actions.delete_buffer,
							},
							["i"] = {
								["<S-Del>"] = actions.delete_buffer,
							},
						},
					},
					lsp_references = {
						initial_mode = "normal",
					},
					builtin = {
						initial_mode = "insert",
					},
					colorscheme = {
						initial_mode = "insert",
					},
					oldfiles = {
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
					live_grep = {
						initial_mode = "insert",
					},
					grep_string = {
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
								["d"] = false,
								["a"] = fb_actions.create,
								["<C-n>"] = fb_actions.create,
								["t"] = actions.select_tab,
								["<C-t>"] = actions.select_tab,
								["<C-c>"] = fb_actions.change_cwd,
								["<F2>"] = fb_actions.rename,
								["<S-Del>"] = fb_actions.remove,
							},
							["i"] = {
								["<C-a>"] = fb_actions.create,
								["<C-c>"] = fb_actions.create,
								["<C-n>"] = fb_actions.create,
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
						vim_diff_opts = {
							ctxlen = vim.o.scrolloff,
						},
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
			-- telescope.load_extension("flutter")

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

			local keymap = vim.keymap.set

			keymap("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "[S]earch [B]uffers" })
			keymap("n", "<leader>sc", "<cmd>Telescope colorscheme<CR>", { desc = "[S]earch [C]olorscheme" })
			keymap("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
			keymap("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
			keymap("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch with [G]rep" })
			-- keymap("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [H]elps" })
			keymap("n", "<leader>sh", "<cmd>Telescope oldfiles<CR>", { desc = "[S]earch file [H]istory" })
			keymap("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "[S]earch [K]eymaps" })
			keymap("n", "<leader>so", "<cmd>Telescope aerial<CR>", { desc = "[S]earch [O]utline" })
			keymap("n", "<leader>sp", "<cmd>Telescope projects<CR>", { desc = "[S]earch [P]rojects" })
			keymap("n", "<leader>sr", "<cmd>Telescope lsp_references<CR>", { desc = "[S]earch [R]eferences" })
			keymap("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "[S]earch [T]o[d]os" })
			keymap("n", "<leader>su", "<cmd>Telescope undo<CR>", { desc = "[S]earch [U]ndos" })
			keymap("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" })
			keymap(
				"n",
				"<leader>sz",
				"<cmd>Telescope current_buffer_fuzzy_find<CR>",
				{ desc = "[S]earch with fu[Z]zy" }
			)

			keymap("n", "<leader>tl", "<cmd>Telescope<CR>", { desc = "[T]e[l]escope builtin picker" })
			keymap("n", "<leader>tp", "<cmd>Telescope planets<CR>", { desc = "[T]elescope view [P]lanets" })
			keymap("n", "<leader>b", "<cmd>Telescope file_browser<CR>", { desc = "Telescope file browser" })
			keymap("n", "<leader>p", "<cmd>Telescope buffers<CR>", { desc = "Telescope find open buffers" })
		end,
	},
}
