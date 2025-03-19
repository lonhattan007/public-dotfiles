-----------------------------------------------------------------------
-- NeoVim config module for markdown preview
-----------------------------------------------------------------------

local M = {
	"epwalsh/obsidian.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	ft = { "markdown", "vim-lug", "vim", "lua" },
}

local home_path = require("user.utils").home_path
local concat_paths = require("user.utils").concat_paths

local dev_notes_vault_path = concat_paths({ home_path, "ObsidianVaults", "DevNotes" })
local dev_notes_vault = {
	name = "DevNotes",
	path = dev_notes_vault_path,
	overrides = {
		templates = {
			subdir = "Templates",
		},
	},
}

local workspaces = {}
local count = 0

if vim.fn.isdirectory(dev_notes_vault_path) > 0 then
	table.insert(workspaces, dev_notes_vault)
	count = count + 1
end

local obsidian_config = function(workspaces)
	require("obsidian").setup({
		workspaces = workspaces,
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

	local keymap = vim.keymap.set

	keymap("n", "<leader>ob", "<cmd>ObsidianQuickSwitch<CR>", { desc = "[O]bsidian [B]rowse and switch notes" })
	keymap("n", "<leader>of", "<cmd>ObsidianFollowLink<CR>", { desc = "[O]bsidian [F]ollow link" })
	keymap("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "[O]bsidian create [N]ew note" })
	keymap("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "[O]pen in [O]bsidian" })
	keymap("n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "[O]bsidian create [N]ew note" })
	keymap("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "[O]bsidian [S]earch" })
	keymap("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "[O]bsidian insert [T]emplate" })
	keymap("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", { desc = "[O]bsidian [W]orkspace info" })

	keymap(
		"v",
		"<leader>oc",
		":'<,'>ObsidianLinkNew<CR>",
		{ desc = "[O]bsidian [C]reate new note linked to selection" }
	)
	keymap("v", "<leader>ol", ":'<,'>ObsidianLink<CR>", { desc = "[O]bsidian create [L]ink from selection" })

	keymap(
		"n",
		"<leader>ch",
		"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
		{ desc = "Toggle markdown checkbox" }
	)
end

if count > 0 then
	M.config = function()
		obsidian_config(workspaces)
	end
end

return {}
