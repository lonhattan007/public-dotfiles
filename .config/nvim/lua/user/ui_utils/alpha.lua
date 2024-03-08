-----------------------------------------------------------------------
-- NeoVim config module for start-up dashboard
-----------------------------------------------------------------------

local alpha_status_ok, alpha = pcall(require, "alpha")
if not alpha_status_ok then
	return
end

local config_dir = ""
local path_sep = package.config:sub(1, 1)

if path_sep == "/" then
	-- unix path separator
	config_dir = "~/.config/nvim"
elseif path_sep == "\\" then
	-- windows path separator
	config_dir = "~\\AppData\\Local\\nvim"
end

local dashboard = require("alpha.themes.dashboard")

-- dashboard.section.header.val = {
-- 	[[                               __                ]],
-- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

-- dashboard.section.header.val = {
-- 	[[                      /^--^\     /^--^\     /^--^\                       ]],
-- 	[[                      \____/     \____/     \____/                       ]],
-- 	[[                     /      \   /      \   /      \                      ]],
-- 	[[                    |        | |        | |        |                     ]],
-- 	[[                     \__  __/   \__  __/   \__  __/                      ]],
-- 	[[|^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|]],
-- 	[[| | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |]],
-- 	[[########################/ /######\ \###########/ /#######################]],
-- 	[[| | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |]],
-- 	[[|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|]],
-- }

dashboard.section.header.val = {
	[[                  /^pp^\                                      ]],
	[[                  \_@@_/                                      ]],
	[[                 /@     \    /^-----^\                        ]],
	[[                |    @@ @|   V  o o  V                        ]],
	[[                 \__  @@/     |  Y  |                         ]],
	[[|^|^|^|^|^|^|^|^|^|^\@\^|^|^|^ \ Q / |^|^|^|^|^|^|^|^|^|^|^|^|]],
	[[| | | | | | | | | | |\@\  | |  / - \ | | | | | | | | | | | | |]],
	[[#####################/@/###### |    \ ########################]],
	[[| | | | | | | | | | |\/ | | |  |     \ | | ) | | | | | | | | |]],
	[[|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_ || (___\==== _|_|_|_|_|_|_|_|_|]],
}

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("b", "  File explorer", ":Telescope file_browser <CR>"),
	dashboard.button("p", "󰳏  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "󰱼  Recent files", ":Telescope oldfiles <CR>"),
	-- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("h", "  Help window", ":top help <CR>"),
	dashboard.button("c", "  Configure", ":e " .. config_dir .. " <CR>"),
	dashboard.button("q", "󰅙  Quit Neovim", ":qa<CR>"),
}

alpha.setup(dashboard.config)
