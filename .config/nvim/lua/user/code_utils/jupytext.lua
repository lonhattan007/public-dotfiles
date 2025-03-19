return {
	{
		"goerz/jupytext.vim",
		ft = { "python" },
		config = function()
			local g = vim.g

			g.jupytext_fmt = "py"
			g.jupytext_style = "hydrogen"
			g.jupytext_to_ipynb_opts = "--to=ipynb --update"
		end,
	},
	{
		"kana/vim-textobj-user",
		ft = { "python" },
	},
	{
		"gcballesteros/vim-textobj-hydrogen",
		ft = { "python" },
		dependencies = { "kana/vim-textobj-user" },
	},
}
