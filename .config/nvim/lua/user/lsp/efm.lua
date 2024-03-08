-----------------------------------------------------------------------
-- NeoVim config module for injecting formatters and linters with `efm`
-----------------------------------------------------------------------

local M = {}

local on_attach = require("user.lsp.lsp_options").on_attach

local stylua = {
	formatCommand = "stylua -",
	formatStdin = true,
}

local isort = {
	formatCommand = "isort --quiet -",
	formatStdin = true,
}

local black = {
	formatCommand = "black --quiet -",
	formatStdin = true,
}

local dartfmt = {
	formatCommand = "dart format",
	formatStdin = true,
}

local google_java_format = {
	formatCommand = "google-java-format --aosp -",
	formatStdin = true,
}

local clang_format = {
	formatCommand = "clang-format",
	formatStdin = true,
}

local gofmt = {
	formatCommand = "gofmt",
	formatStdin = true,
}

local prettier = {
	formatCommand = "prettier --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local prettier_html = {
	formatCommand = "prettier --parser html --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local prettier_css = {
	formatCommand = "prettier --parser css --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local rustywind = {
	formatCommand = "rustywind --stdin",
	formatStdin = true,
}

M.options = {
	on_attach = on_attach,
	init_options = {
		documentFormatting = true,
		documentSymbol = true,
		codeAction = true,
	},
	root_dir = require("lspconfig.util").root_pattern(
		".git",
		"requirements.txt",
		"pyproject.toml",
		"venv",
		"pubspec.yaml",
		".clang-format",
		"_clang-format",
		"go.mod",
		"package.json",
		"tsconfig.json",
		".prettierrc.json",
		".prettierrc.json5",
		".prettierrc.yaml",
		".prettierrc.yml",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.mjs",
		".prettierrc.toml",
		"stylua.toml",
		".stylua.toml",
		"*"
	),
	settings = {
		rootMarkers = { ".git", "*" },
		languages = {
			lua = { stylua },
			python = { isort, black },
			dart = { dartfmt },
			java = { google_java_format },
			c = { clang_format },
			cpp = { clang_format },
			go = { gofmt },
			javascript = { prettier },
			javascriptreact = { rustywind, prettier },
			["javascript.jsx"] = { rustywind, prettier },
			typescript = { prettier },
			typescriptreact = { rustywind, prettier },
			["typescript.tsx"] = { rustywind, prettier },
			vue = { rustywind, prettier },
			svelte = { rustywind, prettier },
			html = { prettier_html },
			css = { prettier_css },
		},
	},
	filetypes = {
		"lua",
		"python",
		"dart",
		"java",
		"c",
		"cpp",
		"go",
		"html",
		"css",
		"scss",
		"yaml",
		"json",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
		"svelte",
		"markdown",
	},
	single_file_support = false,
}

return M
