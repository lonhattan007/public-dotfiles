-----------------------------------------------------------------------
-- NeoVim config module for LaTeX compilation and preview
-----------------------------------------------------------------------

return {
	"lervag/vimtex",
	ft = { "tex", "vim-plug", "vim", "lua" },
	config = function()
		local g = vim.g
		local has = vim.fn.has

		-- VimTeX highlighting - turned off because Treesitter handled it better.
		g.vimtex_syntax_enabled = 0

		-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
		-- strongly recommended, you probably don't need to configure anything. If you
		-- want another compiler backend, you can change it as follows. The list of
		-- supported backends and further explanation is provided in the documentation,
		-- see ":help vimtex-compiler".
		g.vimtex_compiler_method = "generic"
		g.vimtex_compiler_generic = {
			-- continuous = 1,
			command = "lualatex --shell-escape --aux-directory=./auxil --output-directory=./out",
		}

		-- Viewer options: One may configure the viewer either by specifying a built-in
		-- Or with a generic interface:
		-- g.vimtex_view_general_viewer = "okular"
		-- g.vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"

		-- viewer method:
		-- Unix/Linux
		g.vimtex_view_method = "zathura"
		g.vimtex_view_general_viewer = "zathura"

		if has("win64") == 1 then
			-- Windows
			g.vimtex_view_method = "general"
			g.vimtex_view_general_viewer = vim.fn.stdpath("data") .. "\\..\\SumatraPDF\\SumatraPDF.exe"
		elseif has("mac") == 1 then
			-- Mac
			g.vimtex_view_method = "general"
		end
	end,
}
