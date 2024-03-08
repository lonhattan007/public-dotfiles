-----------------------------------------------------------------------
-- NeoVim config module for auto-completion
-----------------------------------------------------------------------

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

local lspkind = require("lspkind")

require("luasnip/loaders/from_vscode").lazy_load()

-- Complete options
vim.opt.completeopt = "menu,menuone,noinsert,noselect"

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local next_option = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif luasnip.expandable() then
		luasnip.expand()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	elseif check_backspace() then
		fallback()
	else
		fallback()
	end
end

local prev_option = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end

cmp.setup({
	enabled = function()
		-- Disable completion in comments
		local context = require("cmp.config.context")
		-- Keep command mode completion enabled when cursor in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		-- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Down>"] = cmp.mapping(next_option, { "i", "s" }),
		["<Tab>"] = cmp.mapping(next_option, { "i", "s" }),
		["<Up>"] = cmp.mapping(prev_option, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(prev_option, { "i", "s" }),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			mode = "symbol",
			with_text = true,
			maxwidth = 30,
			ellipsis_char = "...",
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				path = "[path]",
				luasnip = "[snip]",
				nvim_lua = "[api]",
				gh_issues = "[issues]",
			}
		}),
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "orgmode" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "gh_issues" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		completion = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

-- Add parentheses after selecting function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
