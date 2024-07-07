-----------------------------------------------------------------------
-- NeoVim config module for code snippets
-----------------------------------------------------------------------

return {
	"l3mon4d3/luasnip",
	event = "InsertEnter",
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")

		local s = ls.snippet
		local i = ls.insert_node
		local t = ls.text_node
		local c = ls.choice_node
		local sn = ls.snippet_node
		local isn = ls.indent_snippet_node
		local fmt = require("luasnip.extras.fmt").fmt
		local types = require("luasnip.util.types")

		ls.setup({
			update_events = { "TextChanged", "TextChangedI" },
			region_check_events = {
				"CursorMoved",
				"CursorMovedI",
			},
		})

		ls.config.setup({
			history = false,
		})

		-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		-- 	pattern = {
		-- 		"*.jsx",
		-- 		"*.tsx",
		-- 		"*.html",
		-- 		"*.xml",
		-- 	},
		-- 	callback = function()
		-- 		require("luasnip").unlink_current()
		-- 	end,
		-- })

		-- local function node_with_virtual_text(pos, node, text)
		-- 	local nodes
		-- 	if node.type == types.textNode then
		-- 		node.pos = 2
		-- 		nodes = { i(1), node }
		-- 	else
		-- 		node.pos = 1
		-- 		nodes = { node }
		-- 	end
		-- 	return sn(pos, nodes, {
		-- 		node_ext_opts = {
		-- 			active = {
		-- 				-- override highlight here ("GruvboxOrange").
		-- 				virt_text = { { text, "GruvboxOrange" } },
		-- 			},
		-- 		},
		-- 	})
		-- end
		--
		-- local function nodes_with_virtual_text(nodes, opts)
		-- 	if opts == nil then
		-- 		opts = {}
		-- 	end
		-- 	local new_nodes = {}
		-- 	for pos, node in ipairs(nodes) do
		-- 		if opts.texts[pos] ~= nil then
		-- 			node = node_with_virtual_text(pos, node, opts.texts[pos])
		-- 		end
		-- 		table.insert(new_nodes, node)
		-- 	end
		-- 	return new_nodes
		-- end
		--
		-- local function choice_text_node(pos, choices, opts)
		-- 	choices = nodes_with_virtual_text(choices, opts)
		-- 	return c(pos, choices, opts)
		-- end

		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/user/code_utils/snippets/*.lua", true)) do
			if string.find(ft_path, "init.lua") then
				goto continue
			elseif string.find(ft_path, "utlis.lua") then
				goto continue
			else
				loadfile(ft_path)()
			end
			::continue::
		end
	end,
}
