-----------------------------------------------------------------------
-- NeoVim config module for devicons
-----------------------------------------------------------------------

return {
	"nvim-tree/nvim-web-devicons",
	lazy = false,
	priority = 1000,
	config = function()
		local readme_icon = {
			icon = "󰂺",
			color = "#e2e8f0",
			name = "Readme",
		}

		local tailwind_icon = {
			icon = "󱏿",
			color = "#38bdf8",
			name = "Tailwind",
		}

		local nodejs_icon = {
			icon = "󰎙",
			color = "#84ba64",
			name = "Node",
		}

		local tsconfig_icon = {
			icon = "",
			color = "#3178c6",
			name = "TSConfig",
		}

		local vite_icon = {
			icon = "",
			color = "#ffcb6b",
			name = "Vite",
		}

		local eslint_icon = {
			icon = "󰱺",
			color = "#6358D4",
			name = "Eslint",
		}

		local eslintignore_icon = {
			icon = "󰱺",
			color = "#667085",
			name = "EslintIgnore",
		}

		local storybook_icon = {
			icon = "󰂺",
			color = "#FF4785",
			name = "Storybook",
		}

		local editorconfig_icon = {
			icon = "",
			color = "#f5f5f5",
			name = "EditorConfig",
		}

		local env_icon = {
			icon = "",
			color = "#ffcb6b",
			name = "Env",
		}

		local sh_icon = {
			icon = "",
			color = "white",
			name = "Sh",
		}

		local angular_controller_icon = {
			icon = "",
			color = "cyan",
			name = "NgCtrl",
		}

		local angular_service_icon = {
			icon = "",
			color = "yellow",
			name = "NgSvc",
		}

		local angular_repo_icon = {
			icon = "",
			color = "pink",
			name = "NgRepo",
		}

		local angular_dto_icon = {
			icon = "",
			color = "coral",
			name = "NgDto",
		}

		require("nvim-web-devicons").setup({
			override = {
				["cshtml"] = {
					icon = "󰁥",
					color = "#6f42c1",
					name = "Cshtml",
				},
				[".nvmrc"] = nodejs_icon,
				[".editorconfig"] = editorconfig_icon,
				[".eslintignore"] = eslintignore_icon,
				["env"] = env_icon,
				["sh"] = sh_icon,
			},
			override_by_filename = {
				["tsconfig.json"] = tsconfig_icon,
				["tsconfig.node.json"] = tsconfig_icon,
				["tailwind.config.js"] = tailwind_icon,
				["tailwind.config.ts"] = tailwind_icon,
				["vite.config.js"] = vite_icon,
				["vite.config.ts"] = vite_icon,
				[".eslintrc.js"] = eslint_icon,
				[".eslintrc.cjs"] = eslint_icon,
				[".eslintrc.ts"] = eslint_icon,
				[".eslintrc.json"] = eslint_icon,
				[".eslintrc.yml"] = eslint_icon,
				[".eslintrc.yaml"] = eslint_icon,
				["bspwmrc"] = sh_icon,
			},
			override_by_extension = {
				["mmd"] = {
					icon = "",
					color = "#ff3570",
					name = "Mermaid",
				},
				["toml"] = {
					icon = "󰬁",
					color = "#bbbbbb",
					name = "Toml",
				},
				["stories.tsx"] = storybook_icon,
				["stories.jsx"] = storybook_icon,
				["controller.ts"] = angular_controller_icon,
				["service.ts"] = angular_service_icon,
				["repository.ts"] = angular_repo_icon,
				["dto.ts"] = angular_dto_icon,
			},
		})
	end,
}
