-----------------------------------------------------------------------
-- NeoVim config module for plugins management
-----------------------------------------------------------------------

-- prepare for lazy migration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- colorschemes
	{ import = "user.colorscheme.themes" },

	-- keymaps
	{ import = "user.keymaps" },

	-- code utils
	{ import = "user.code_utils" },

	-- ui utils
	{ import = "user.ui_utils" },

	-- lsp
	{ import = "user.lsp" },

	-- metrics
	{ "dstein64/vim-startuptime", event = "VeryLazy" },

	-- vim session
	{ "tpope/vim-obsession", event = "VeryLazy" },

	-- tmux motion integration
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },

	-- search index
	{ "google/vim-searchindex", event = "VeryLazy" },

	-- unicode characters helper
	{ "chrisbra/unicode.vim" },

	-- highlighting for rasi files
	{ "Fymyte/rasi.vim" },

	-- vim discipline
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		opts = {
			max_time = 1000,
			max_count = 5,
			disable_mouse = false,
			hint = true,
			allow_different_key = false,
			-- hint_keys = { "k", "j", "^", "$", "a", "x", "i", "d", "y", "c", "l" },
			hint_keys = {},
			resetting_keys = {
				["1"] = { "n", "v" },
				["2"] = { "n", "v" },
				["3"] = { "n", "v" },
				["4"] = { "n", "v" },
				["5"] = { "n", "v" },
				["6"] = { "n", "v" },
				["7"] = { "n", "v" },
				["8"] = { "n", "v" },
				["9"] = { "n", "v" },
				["c"] = { "n" },
				["C"] = { "n" },
				["d"] = { "n" },
				["x"] = { "n" },
				["X"] = { "n" },
				["y"] = { "n" },
				["Y"] = { "n" },
				["p"] = { "n" },
				["P"] = { "n" },
			},
			restricted_keys = {
				["h"] = { "n", "v" },
				["j"] = { "n", "v" },
				["k"] = { "n", "v" },
				["l"] = { "n", "v" },
				["-"] = { "n", "v" },
				["+"] = { "n", "v" },
				["gj"] = { "n", "v" },
				["gk"] = { "n", "v" },
				["<CR>"] = { "n", "v" },
				["<C-M>"] = { "n", "v" },
				["<C-N>"] = { "n", "v" },
				["<C-P>"] = { "n", "v" },
			},
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
			disabled_filetypes = {
				"aerial",
				"flutterToolsOutline",
				"dapui_breakpoints",
				"dapui_console",
				"dapui_repl",
				"dapui_scopes",
				"dapui_stacks",
				"dapui_watches",
				"lazy",
				"netrw",
				"NvimTree",
				"mason",
				"qf",
				"undotree",
			},
		},
	},
}, {
	root = vim.fn.stdpath("data") .. "/lazy",
	install = {
		missing = true,
		colorscheme = { "onenord", "catppuccin", "habamax " },
	},
	ui = {
		border = "rounded",
		-- if you have a nerd font, set icons to an empty table which will use the
		-- default lazy.nvim defined nerd font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
