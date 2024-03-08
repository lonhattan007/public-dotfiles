-----------------------------------------------------------------------
-- NeoVim config module for linters and formatters integration
-----------------------------------------------------------------------

local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
	return
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	return
end

mason_null_ls.setup({
	ensure_installed = {
		-- "prettierd", -- prettier_d
		-- "isort",
		-- "black",
		-- "gofmt",
		-- "dart_format",
		-- "google-java-format",
		-- "clang-format",
		-- "stylua",
		-- "rustywind",
		-- "stylelint_lsp",
		-- "cspell",
	},
	automatic_installation = true,
})

local sources = {
	-- html, frontend, js, ts
	-- null_ls.builtins.formatting.prettierd,
	-- null_ls.builtins.formatting.rustywind,
	-- null_ls.builtins.diagnostics.stylint,

	-- python
	-- null_ls.builtins.diagnostics.pylint,
	-- null_ls.builtins.formatting.isort,
	-- null_ls.builtins.formatting.black,

	-- go
	-- null_ls.builtins.formatting.gofmt,

	-- dart, flutter
	-- null_ls.builtins.formatting.dart_format,

	-- lua
	-- null_ls.builtins.formatting.stylua,

	--[[ null_ls.builtins.diagnostics.cspell.with({
		disabled_filetypes = { "lua", "sh", "conf" },
		diagnostic_config = {
			virtual_text = false,
		},
	}), ]]
	-- null_ls.builtins.code_actions.cspell,
}

null_ls.setup({
	border = "rounded",
	sources = sources,
})
