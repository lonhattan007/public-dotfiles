-----------------------------------------------------------------------
-- NeoVim config module for key bindings recognizer
-----------------------------------------------------------------------

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

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
			hidden = {
				"<silent>",
				"<cmd>",
				"<Cmd>",
				"<CR>",
				"call",
				"lua",
				"^:",
				"^ ",
			},
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

		-- Leader prefix
		wk.register({
			["<leader>"] = {
				["b"] = {
					"<cmd>Telescope file_browser<CR>",
					"Telescope file browser",
				},
				["ch"] = {
					"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
					"Toggle markdown checkbox",
				},
				["l"] = { "<cmd>Twilight<CR>", "Focus code dimming" },
				["m"] = { "<cmd>TroubleToggle<CR>", "Toggle problems list" },
				-- ["o"] = { "<cmd>AerialToggle! right<CR>", "Toggle outline tree" },
				["p"] = {
					"<cmd>Telescope buffers<CR>",
					"Telescope find open buffers",
				},
				-- ["u"] = { "<cmd>Telescope undo<CR>", "Telescope undo" },
				["v"] = {
					"<cmd>MarkdownPreviewToggle<CR>",
					"Toggle markdown preview",
				},
				["wk"] = { "<cmd>W<CR>", "Turn on which-key manual" },
				-- ["<space>w"] = { "<cmd>bw<CR>", "Close buffer" },
				-- ["x"] = { "<cmd>TransparentToggle<CR>", "Toggle transparency" },
				["z"] = { "<cmd>ZenMode<CR>", "Toggle zen mode" },
			},
		})

		-- NvimTree
		wk.register({
			["<leader>e"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" },
		}, {
			mode = { "n", "v" },
			silent = true,
			noremap = true,
		})

		wk.register({
			["<A-1>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
		}, {
			mode = { "n", "v", "i" },
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
					"[F]lutter [C]ommands",
				},
				["d"] = {
					"<cmd>FlutterDevices<CR>",
					"Choose [F]lutter [D]evice",
				},
				["e"] = {
					"<cmd>FlutterEmulators<CR>",
					"Choose [F]lutter [E]mulator",
				},
				["o"] = {
					"<cmd>FlutterOutlineToggle<CR>",
					"Toggle [F]lutter [O]utline",
				},
				["s"] = {
					"<cmd>FlutterRun<CR>",
					"[F]lutter [S]tart app",
				},
				["q"] = {
					"<cmd>FlutterQuit<CR>",
					"[F]lutter [Q]uit",
				},
				["r"] = {
					"<cmd>FlutterReload<CR>",
					"[F]lutter hot [R]eload",
				},
				["z"] = {
					"<cmd>FlutterRestart<CR>",
					"[F]lutter hot restart",
				},
			},
			-- Telescope utils
			["s"] = {
				name = "Telescope search utils",
				["b"] = { "<cmd>Telescope buffers<CR>", "[S]earch [B]uffers" },
				["c"] = {
					"<cmd>Telescope colorscheme<CR>",
					"[S]earch [C]olorscheme",
				},
				["d"] = {
					"<cmd>Telescope diagnostics<CR>",
					"[S]earch [D]iagnostics",
				},
				["f"] = { "<cmd>Telescope find_files<CR>", "[S]earch [F]iles" },
				["g"] = {
					"<cmd>Telescope live_grep<CR>",
					"[S]earch with [G]rep",
				},
				["h"] = { "<cmd>Telescope help_tags<CR>", "[S]earch [H]elps" },
				["k"] = { "<cmd>Telescope keymaps<CR>", "[S]earch [K]eymaps" },
				["o"] = { "<cmd>Telescope aerial<CR>", "[S]earch [O]utline" },
				["p"] = { "<cmd>Telescope projects<CR>", "[S]earch [P]rojects" },
				["t"] = { "<cmd>TodoTelescope<CR>", "[S]earch [T]o[d]os" },
				["u"] = { "<cmd>Telescope undo<CR>", "[S]earch [U]ndos" },
				["w"] = {
					"<cmd>Telescope grep_string<CR>",
					"[S]earch current [W]ord",
				},
				["z"] = {
					"<cmd>Telescope current_buffer_fuzzy_find<CR>",
					"[S]earch with fu[Z]zy",
				},
			},
			["t"] = {
				name = "Telescope other utils",
				["l"] = {
					"<cmd>Telescope<CR>",
					"[T]e[l]escope builtin pickers",
				},
				["p"] = {
					"<cmd>Telescope planets<CR>",
					"[T]elescope view [P]lanets",
				},
			},
		}, { prefix = "<leader>" })

		-- Obsidian actions
		wk.register({
			["o"] = {
				name = "Obsidian actions",
				["o"] = { "<cmd>ObsidianOpen<CR>", "[O]pen in [O]bsidian" },
				["b"] = {
					"<cmd>ObsidianQuickSwitch<CR>",
					"[O]bsidian [B]rowse and switch notes",
				},
				["f"] = {
					"<cmd>ObsidianFollowLink<CR>",
					"[O]bsidian [F]ollow link",
				},
				["n"] = {
					"<cmd>ObsidianNew<CR>",
					"[O]bsidian create [N]ew note",
				},
				["r"] = {
					"<cmd>ObsidianRename<CR>",
					"[O]bsidian create [N]ew note",
				},
				["s"] = { "<cmd>ObsidianSearch<CR>", "[O]bsidian [S]earch" },
				["t"] = {
					"<cmd>ObsidianTemplate<CR>",
					"[O]bsidian insert [T]emplate",
				},
				["w"] = {
					"<cmd>ObsidianWorkspace<CR>",
					"[O]bsidian [W]orkspace info",
				},
			},
		}, { prefix = "<leader>" })

		wk.register({
			["o"] = {
				name = "Obsidian actions",
				["c"] = {
					":'<,'>ObsidianLinkNew<CR>",
					"[O]bsidian [C]reate new note linked to selection",
				},
				["l"] = {
					":'<,'>ObsidianLink<CR>",
					"[O]bsidian create [L]ink from selection",
				},
			},
		}, { prefix = "<leader>", mode = "v" })

		-- Tmux motion integration
		wk.register({
			["<space>"] = {
				name = "Working with panes and buffers",
				["h"] = { "<cmd>TmuxNavigateLeft<CR>", "Focus on left pane" },
				["j"] = { "<cmd>TmuxNavigateDown<CR>", "Focus on upper pane" },
				["k"] = { "<cmd>TmuxNavigateUp<CR>", "Focus on right pane" },
				["l"] = { "<cmd>TmuxNavigateRight<CR>", "Focus on lower pane" },
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

		-- Emmet
		wk.register({
			["<A-e>"] = { "<cmd>LspStart emmet_ls<CR>", "Start Emmet" },
			["<A-S-e>"] = { "<cmd>LspStop emmet_ls<CR>", "Stop Emmet" },
		}, {
			mode = { "n", "i" },
			silent = true,
			noremap = true,
		})

		-- Iron
		wk.register({
			["<leader>cs"] = {
				"<cmd>lua require('iron.core').send_line()<CR>",
				"Iron [S]end [C]ommand",
			},
		}, {
			mode = { "n" },
			silent = true,
			noremap = true,
		})

		wk.register({
			["<leader>cs"] = {
				"<cmd>lua require('iron.core').visual_send()<CR>",
				"Iron Visual [S]end [C]ommand",
			},
		}, {
			mode = { "v" },
			silent = true,
			noremap = true,
		})

		-- Command palette
		wk.register({
			[";"] = { "<cmd>FineCmdline<CR>", "Command Palette" },
		}, {
			mode = { "n" },
			silent = true,
			noremap = true,
		})

		wk.register({
			["<C-p>"] = { "<cmd>FineCmdline<CR>", "Command [P]alette" },
		}, {
			mode = { "i" },
			silent = true,
			noremap = true,
		})
	end,
}
