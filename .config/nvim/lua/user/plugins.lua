-----------------------------------------------------------------------
-- NeoVim config module for plugins management
-----------------------------------------------------------------------

-- Auto install vim-plug
vim.cmd([[
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
	let release_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  '.release_url
  endif

  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif
]])

local pluggins_dir = vim.fn.stdpath("data") .. package.config:sub(1, 1) .. "plugged"
local Plug = vim.fn["plug#"]

vim.call("plug#begin", pluggins_dir)

-- ui -----------------------------------------------------------
-- colorschemes
Plug("edeneast/nightfox.nvim")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("rebelot/kanagawa.nvim")
Plug("folke/tokyonight.nvim", { branch = "main" })
Plug("navarasu/onedark.nvim")
Plug("neanias/everforest-nvim", { branch = "main" })
Plug("projekt0n/github-nvim-theme")
Plug("rmehri01/onenord.nvim", { branch = "main" })

-- transparency
Plug("xiyaowong/nvim-transparent")

-- folder tree
Plug("nvim-tree/nvim-tree.lua")

-- outline tree
Plug("stevearc/aerial.nvim")

-- status line + tab line
Plug("nvim-lualine/lualine.nvim")
Plug("akinsho/bufferline.nvim")
-- sync tmux line theme with neovim's color scheme
Plug("edkolev/tmuxline.vim")

-- icons
Plug("nvim-tree/nvim-web-devicons")

-- dashboard
Plug("goolord/alpha-nvim")

-- zenmode and focus lighting
Plug("folke/zen-mode.nvim")
Plug("folke/twilight.nvim")

-- terminal
Plug("akinsho/toggleterm.nvim")

-- git integration
Plug("lewis6991/gitsigns.nvim")
Plug("tpope/vim-fugitive")
-- plug("pwntester/octo.nvim")

-- fuzzy finder
Plug("nvim-telescope/telescope.nvim", { branch = "0.1.x" }) -- depends on `plenary`
Plug("nvim-telescope/telescope-file-browser.nvim") -- depends on `telescope`
Plug("debugloop/telescope-undo.nvim") -- depends on `telescope`
Plug("nvim-lua/plenary.nvim")

-- project management
-- plug("ahmedkhalf/project.nvim")
Plug("lonhattan007/project.nvim") -- depends on `telescope`

-- command palette
Plug("muniftanjim/nui.nvim")
Plug("vonheikemen/fine-cmdline.nvim") -- depends on `nui`

-- highlight word instances
Plug("rrethy/vim-illuminate")

-- headlines
-- plug("lukas-reineke/headlines.nvim", { ["for"] = { "markdown", "vim-lug", "vim", "lua" } })

-- code supports ------------------------------------------------
-- syntax tree
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":tsupdate" })
Plug("nvim-treesitter/nvim-treesitter-textobjects") -- depends on `nvim-treesitter`
Plug("nvim-treesitter/nvim-treesitter-context") -- depends on `nvim-treesitter`

-- format supports
Plug("windwp/nvim-ts-autotag") -- auto close tags, depends on `nvim-treesitter`
Plug("windwp/nvim-autopairs") -- auto close brackets
Plug("numtostr/comment.nvim") -- comment shortcuts
Plug("p00f/nvim-ts-rainbow") -- bracket colorizer
-- plug("afonsocraposo/nvim-colorizer.lua") -- highlight color codes
Plug("nvchad/nvim-colorizer.lua") -- highlight color codes
Plug("kylechui/nvim-surround") -- surround code with brackets, tags, and quotations
Plug("lukas-reineke/indent-blankline.nvim") -- indentation guides

-- lsps
Plug("neovim/nvim-lspconfig")
Plug("antosha417/nvim-lsp-file-operations") -- dependes on `plenary` and `neo-tree`/`nvim-tree`
Plug("onsails/lspkind.nvim") -- configs for icons used by lsps
Plug("j-hui/fidget.nvim")
--,{ ["tag"] = "legacy" })
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim") -- depends on `mason` and `lspconfig`
Plug("whoissethdaniel/mason-tool-installer.nvim") -- depends on `mason`
-- plug("jay-babu/mason-null-ls.nvim") -- dependends on `mason` and `null-ls`
-- plug("jose-elias-alvarez/null-ls.nvim") -- inject lsps, linters, formatters and daps
-- flutter utilities
Plug("akinsho/flutter-tools.nvim", { ["for"] = "dart" }) -- depends on `plenary`, `telescope`/`dressing`

-- rename
Plug("filipdutescu/renamer.nvim", { branch = "master" }) -- depends on `plenary`
Plug("weilbith/nvim-code-action-menu")
Plug("kosayoda/nvim-lightbulb")

-- autocomplete
Plug("hrsh7th/nvim-cmp") -- depends on all snippet-related plugins below
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("l3mon4d3/luasnip")
Plug("saadparwaiz1/cmp_luasnip")

-- daps
-- plug("mfussenegger/nvim-dap")
-- plug("rcarriga/nvim-dap-ui") -- depends on `nvim-dap`
-- plug("jay-babu/mason-nvim-dap.nvim") -- depends on `mason` and `nvim-dap`

-- trouble listing
Plug("folke/trouble.nvim") -- partially depends on `nvim-web0devicons`

-- todo comments highlighting
Plug("folke/todo-comments.nvim") -- depends con `plenary`

-- antlr highlighter
-- plug("jrozner/vim-antlr")

-- markdown preview
Plug("iamcco/markdown-preview.nvim", {
	["do"] = "cd app && ./install.sh",
	["for"] = { "markdown", "vim-plug", "vim", "lua" },
})

-- obsidian
Plug("epwalsh/obsidian.nvim", {
	["for"] = { "markdown", "vim-plug", "vim", "lua" },
}) -- depends on `plenary` and `telescope`

-- jupyter note book
Plug("vigemus/iron.nvim", {
	["for"] = { "python" },
})
Plug("goerz/jupytext.vim")
Plug("kana/vim-textobj-user")
Plug("gcballesteros/vim-textobj-hydrogen") -- depends on `vim-textobj-user`

-- latex utilities
Plug("lervag/vimtex", { ["for"] = { "tex", "vim-plug", "vim", "lua" } })

-- other utilities ----------------------------------------------

-- shortcuts reminder
Plug("folke/which-key.nvim")
Plug("anuvyklack/hydra.nvim")

-- vim session
Plug("tpope/vim-obsession")

-- tmux motion integration
Plug("christoomey/vim-tmux-navigator")

-- vim discipline
Plug("m4xshen/hardtime.nvim")

-- metrics
Plug("dstein64/vim-startuptime")

vim.call("plug#end")

-- prepare for lazy migration
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
-- 	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
-- 	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
-- end ---@diagnostic disable-next-line: undefined-field
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup({
-- 	root = vim.fn.stdpath("data") .. "/lazy",
-- 	install = {
-- 		missing = true,
-- 		colorscheme = { "catppuccin", "habamax " },
-- 	},
-- 	ui = {
-- 		-- if you have a nerd font, set icons to an empty table which will use the
-- 		-- default lazy.nvim defined nerd font icons otherwise define a unicode icons table
-- 		icons = vim.g.have_nerd_font and {} or {
-- 			cmd = "⌘",
-- 			config = "🛠",
-- 			event = "📅",
-- 			ft = "📂",
-- 			init = "⚙",
-- 			keys = "🗝",
-- 			plugin = "🔌",
-- 			runtime = "💻",
-- 			require = "🌙",
-- 			source = "📄",
-- 			start = "🚀",
-- 			task = "📌",
-- 			lazy = "💤 ",
-- 		},
-- 	},
-- })
