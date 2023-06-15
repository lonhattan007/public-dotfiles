-----------------------------------------------------------------------
-- NeoVim config module for plugins management
-----------------------------------------------------------------------

local pluggins_dir = vim.fn.stdpath("data")
		.. package.config:sub(1, 1)
		.. "plugged"

local Plug = vim.fn["plug#"]

vim.call("plug#begin", pluggins_dir)

-- UI -----------------------------------------------------------
-- Colorschemes
Plug("EdenEast/nightfox.nvim")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("rebelot/kanagawa.nvim")
Plug("folke/tokyonight.nvim", { branch = "main" })
Plug("navarasu/onedark.nvim")

-- Transparency
Plug("xiyaowong/nvim-transparent")

-- Folder tree
Plug("nvim-tree/nvim-tree.lua")

-- Outline tree
Plug("stevearc/aerial.nvim")

-- Status line + tab line
Plug("nvim-lualine/lualine.nvim")
Plug("akinsho/bufferline.nvim")

-- Icons
Plug("nvim-tree/nvim-web-devicons")

-- Dashboard
Plug("goolord/alpha-nvim")

-- Zenmode and focus lighting
Plug("folke/zen-mode.nvim")
Plug("folke/twilight.nvim")

-- Terminal
Plug("akinsho/toggleterm.nvim")

-- Git integration
Plug("lewis6991/gitsigns.nvim")
Plug("tpope/vim-fugitive")

-- Project management
-- Plug("ahmedkhalf/project.nvim")
Plug("lonhattan007/project.nvim")

-- Fuzzy finder
Plug("nvim-telescope/telescope.nvim", { branch = "0.1.x" })
Plug("nvim-telescope/telescope-file-browser.nvim")
Plug("debugloop/telescope-undo.nvim")
Plug("nvim-lua/plenary.nvim")

-- Code supports ------------------------------------------------
-- Syntax tree
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- Format supports
Plug("windwp/nvim-ts-autotag")              -- Auto close tags
Plug("windwp/nvim-autopairs")               -- Auto close brackets
Plug("numToStr/Comment.nvim")               -- Comment shortcuts
Plug("p00f/nvim-ts-rainbow")                -- Bracket colorizer
Plug("afonsocraposo/nvim-colorizer.lua")    -- Highlight color codes
Plug("kylechui/nvim-surround")              -- Surround code with brackets, tags, and quotations
Plug("lukas-reineke/indent-blankline.nvim") -- Indentation guides
Plug("jose-elias-alvarez/null-ls.nvim")     -- Inject LSPs, linters, formatters and DAPs

-- LSPs
Plug("neovim/nvim-lspconfig")
Plug("onsails/lspkind.nvim")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("jay-babu/mason-null-ls.nvim")
-- Rename
Plug("filipdutescu/renamer.nvim", { branch = "master" })

-- Autocomplete
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

-- Trouble listing
Plug("folke/trouble.nvim")

-- TODO comments highlighting
Plug("folke/todo-comments.nvim")

-- Markdown preview
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && npm install" })

-- LaTeX utilities
Plug("lervag/vimtex")

-- Other utilities ----------------------------------------------

-- Shortcuts reminder
Plug("folke/which-key.nvim")
Plug("anuvyklack/hydra.nvim")

-- Vim session
Plug("tpope/vim-obsession")

-- Tmux motion integration
Plug("christoomey/vim-tmux-navigator")

vim.call("plug#end")
