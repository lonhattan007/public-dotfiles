-----------------------------------------------------------------------
-- NeoVim config module for Flutter's specific configs
-----------------------------------------------------------------------

return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	ft = { "dart", "yaml" },
	config = function()
		local home_path = require("user.utils").home_path
		local path_sep = require("user.utils").path_sep
		local concat_paths = require("user.utils").concat_paths

		local sys_flutter_path = ""

		if path_sep == "/" then
			-- unix path separator
			-- equivalent of "$HOME/Development/..."
			sys_flutter_path = concat_paths({
				home_path,
				".local",
				"bin",
				"flutter",
				"bin",
				"flutter",
			})
		elseif path_sep == "\\" then
			-- windows path separator
			-- equivalent of "$HOME/Development/..."
			sys_flutter_path = concat_paths({
				home_path,
				"Development",
				"flutter",
				"bin",
				"flutter.bat",
			})
		end

		local lsp_options = require("user.lsp.config.lsp_options")

		require("flutter-tools").setup({
			ui = {
				border = "rounded",
				notification_style = "native",
			},
			decorations = {
				statusline = {
					app_version = false,
					device = true,
				},
			},
			flutter_path = sys_flutter_path,
			widget_guides = {
				enabled = true,
			},
			lsp = {
				on_attach = lsp_options.on_attach,
				capabilities = lsp_options.capabilities,
			},
		})

		require("which-key").add({
			icon = "",
			{ "<leader>f", group = "Flutter commands" },
			{ "<leader>fc", "<cmd>Telescope flutter commands<CR>", desc = "[F]lutter [C]ommands" },
			{ "<leader>fd", "<cmd>FlutterDevices<CR>", desc = "Choose [F]lutter [D]evice" },
			{ "<leader>fe", "<cmd>FlutterEmulators<CR>", desc = "Choose [F]lutter [E]mulator" },
			{ "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Toggle [F]lutter [O]utline" },
			{ "<leader>fq", "<cmd>FlutterQuit<CR>", desc = "[F]lutter [Q]uit" },
			{ "<leader>fr", "<cmd>FlutterReload<CR>", desc = "[F]lutter hot [R]eload" },
			{ "<leader>fs", "<cmd>FlutterRun<CR>", desc = "[F]lutter [S]tart app" },
			{ "<leader>fz", "<cmd>FlutterRestart<CR>", desc = "[F]lutter hot restart" },
		})
	end,
}
