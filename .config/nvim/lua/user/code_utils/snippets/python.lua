-----------------------------------------------------------------------
-- NeoVim config module for Python snippets
-----------------------------------------------------------------------

local ls = require("luasnip")
local utils = require("user.code_utils.snippets.utils")

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

local ct = utils.ct

ls.add_snippets("python", {
	s(
		"d",
		fmt([[def {func}({args}){ret}:\n\t{doc}{body} ]], {
			func = i(1),
			args = i(2),
			ret = c(3, {
				t(""),
				sn(nil, {
					t(" -> "),
					i(1),
				}),
			}),
			doc = isn(4, {
				ct(1, {
					t(""),
					-- NOTE we need to surround the `fmt` with `sn` to make this work
					sn(1, fmt([[ """{desc}""" ]], { desc = i(1) })),
					sn(
						2,
						fmt(
							[[
			"""{desc}

			Args:
			{args}

			Returns:
			{returns}
			"""

			]],
							{
								desc = i(1),
								args = i(2), -- TODO should read from the args in the function
								returns = i(3),
							}
						)
					),
				}, {
					texts = {
						"(no docstring)",
						"(single line docstring)",
						"(full docstring)",
					},
				}),
			}, "$PARENT_INDENT\t"),
			body = i(0),
		})
	),
	s(
		"ad",
		fmt(
			[[
		async def {func}({args}){ret}:
			{doc}{body}
	]],
			{
				func = i(1),
				args = i(2),
				ret = c(3, {
					t(""),
					sn(nil, {
						t(" -> "),
						i(1),
					}),
				}),
				doc = isn(4, {
					ct(1, {
						t(""),
						-- NOTE we need to surround the `fmt` with `sn` to make this work
						sn(
							1,
							fmt(
								[[
			"""{desc}"""

			]],
								{ desc = i(1) }
							)
						),
						sn(
							2,
							fmt(
								[[
			"""{desc}

			Args:
			{args}

			Returns:
			{returns}
			"""

			]],
								{
									desc = i(1),
									args = i(2), -- TODO should read from the args in the function
									returns = i(3),
								}
							)
						),
					}, {
						texts = {
							"(no docstring)",
							"(single line docstring)",
							"(full docstring)",
						},
					}),
				}, "$PARENT_INDENT\t"),
				body = i(0),
			}
		)
	),
	s(
		"main",
		fmt(
			[[
				if __name__ == "__main__":
					{body}
	]],
			{
				body = i(0),
			}
		)
	),
})
