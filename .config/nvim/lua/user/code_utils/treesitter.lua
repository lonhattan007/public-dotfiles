-----------------------------------------------------------------------
-- NeoVim config module for syntax highlighting
-----------------------------------------------------------------------

return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			local lang_lst = {
				-- My fav -----------
				"python",
				"go",
				"gomod",
				"dart",
				-- Docs and configs -
				"json",
				"yaml",
				"dockerfile",
				"bash",
				"markdown",
				"mermaid",
				"latex",
				-- "org",
				"toml",
				"ron",
				-- "yuck",
				"hcl",
				"make",
				"vim",
				"vimdoc",
				"regex",
				"nix",
				-- Front-end --------
				"html",
				"css",
				"scss",
				-- "javascript",
				"typescript",
				"tsx",
				"vue",
				"svelte",
				-- Android ----------
				"kotlin",
				"java",
				-- Back-end ---------
				"prisma",
				"graphql",
				"http",
				"sql",
				-- Others -----------
				"lua",
				"rust",
				"r",
				-- "solidity",
				"c",
				"cpp",
				"c_sharp",
				-- "cuda",
				-- "php",
			}

			treesitter.setup({
				ensure_installed = lang_lst,
				highlight = {
					enable = true,
				},
				-- autotag = {
				-- 	enable = true,
				-- },
				rainbow = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = "<C-S-space>",
						node_decremental = "<C-BS>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
						},
						goto_previrous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
						},
						goto_previrous_end = {
							["[F"] = "@function.outer",
							["[C"] = "class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})

			-- Folding
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "FileReadPost" }, {
				pattern = { "*" },
				command = "normal zR",
			})
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldenable = false

			-- JS
			vim.treesitter.language.register("typescript", "javascript")
			vim.treesitter.language.register("tsx", "javascript.jsx")
			vim.treesitter.language.register("tsx", "javascriptreact")
		end,
	},
}
