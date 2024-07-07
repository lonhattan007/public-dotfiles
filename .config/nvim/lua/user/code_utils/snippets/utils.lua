local M = {}

local ls = require("luasnip")

local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local types = require("luasnip.util.types")

M.node_with_virtual_text = function(pos, node, text)
	local nodes
	if node.type == types.textNode then
		node.pos = 2
		nodes = { i(1), node }
	else
		node.pos = 1
		nodes = { node }
	end
	return sn(pos, nodes, {
		node_ext_opts = {
			active = {
				-- override highlight here ("GruvboxOrange").
				virt_text = { { text, "GruvboxOrange" } },
			},
		},
	})
end

M.nodes_with_virtual_text = function(nodes, opts)
	if opts == nil then
		opts = {}
	end
	local new_nodes = {}
	for pos, node in ipairs(nodes) do
		if opts.texts[pos] ~= nil then
			node = M.node_with_virtual_text(pos, node, opts.texts[pos])
		end
		table.insert(new_nodes, node)
	end
	return new_nodes
end

M.choice_text_node = function(pos, choices, opts)
	choices = M.nodes_with_virtual_text(choices, opts)
	return c(pos, choices, opts)
end

M.ct = M.choice_text_node

return M
