-----------------------------------------------------------------------
-- NeoVim config module for NvimTree
-----------------------------------------------------------------------

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			auto_reload_on_write = true,
			disable_netrw = false,
			hijack_cursor = false,
			hijack_netrw = false,
			hijack_unnamed_buffer_when_opening = false,
			sort_by = "name",
			root_dirs = {},
			prefer_startup_root = true,
			sync_root_with_cwd = false,
			reload_on_bufenter = false,
			respect_buf_cwd = false,
			on_attach = "default",
			select_prompts = false,
			view = {
				centralize_selection = false,
				cursorline = true,
				debounce_delay = 15,
				width = 34,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				highlight_modified = "none",
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					modified_placement = "after",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "",
						modified = "●",
						folder = {
							arrow_closed = "▸",
							arrow_open = "▾",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				special_files = {
					"Cargo.toml",
					"Makefile",
					"README.md",
					"readme.md",
				},
				symlink_destination = true,
			},
			hijack_directories = {
				enable = false,
				auto_open = false,
			},
			update_focused_file = {
				enable = true,
				update_root = true,
				ignore_list = {},
			},
			system_open = {
				cmd = "",
				args = {},
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = {},
				exclude = {},
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {},
			},
			git = {
				enable = true,
				ignore = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
				timeout = 400,
			},
			modified = {
				enable = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
					exclude = {},
				},
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "shadow",
						style = "minimal",
					},
				},
				open_file = {
					quit_on_open = false,
					resize_window = true,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = {
								"notify",
								"packer",
								"qf",
								"diff",
								"fugitive",
								"fugitiveblame",
							},
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
				remove_file = {
					close_window = true,
				},
			},
			trash = {
				cmd = "gio trash",
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			tab = {
				sync = {
					open = true,
					close = false,
					ignore = {},
				},
			},
			notify = {
				threshold = vim.log.levels.INFO,
			},
			ui = {
				confirm = {
					remove = true,
					trash = true,
				},
			},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					dev = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})

		-- Added keymap for escaping nvimtree without closing
		-- Similar to the motion on IntelliJ's vim config
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			callback = function(opts)
				if vim.bo[opts.buf].filetype == "NvimTree" then
					vim.keymap.set("n", "<Esc>", "<C-w>w", {
						silent = true,
					})

					vim.keymap.set("n", "<space>e", "<cmd>NvimTreeToggle<CR>", {
						silent = true,
					})
				else
					vim.keymap.set("n", "<Esc>", "<Nop>", {
						silent = true,
					})
				end
			end,
		})

		local keymap = vim.keymap.set

		keymap({ "n", "v" }, "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
		keymap({ "n", "v" }, "<space>e", "<cmd>NvimTreeToggle<CR>", { desc = "Focus NvimTree" })
		-- keymap({ "n", "v", "i" }, "<M-1>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
		-- keymap({ "n", "v", "i" }, "<M-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
	end,
}
