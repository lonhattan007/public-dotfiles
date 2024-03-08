-----------------------------------------------------------------------
-- NeoVim config module for devicons
-----------------------------------------------------------------------

local devicons_status_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status_ok then
	return
end

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

devicons.setup({
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
	},
})
