-----------------------------------------------------------------------
-- NeoVim config module for syntax highlighting
-----------------------------------------------------------------------

local treesitter_status_ok, treesitter =
    pcall(require, "nvim-treesitter.configs")
if not treesitter_status_ok then
    return
end

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
    "latex",
    "org",
    "toml",
    "hcl",
    "make",
    "vim",
    "vimdoc",
    "regex",
    -- Front-end --------
    "html",
    "css",
    "scss",
    "javascript",
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
    "solidity",
    "c",
    "cpp",
    "c_sharp",
    "cuda",
    "php",
}

treesitter.setup({
    ensure_installed = lang_lst,
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
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
