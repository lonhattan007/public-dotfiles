-----------------------------------------------------------------------
-- NeoVim config module for start-up dashboard
-----------------------------------------------------------------------

return {
    "goolord/alpha-nvim",
    config = function()
        local config_dir = vim.fn.stdpath("config")

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

        local dashboard_entries = {
            dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("b", "  File explorer", ":Telescope file_browser <CR>"),
            dashboard.button("r", "󰱼  Recent files", ":Telescope oldfiles <CR>"),
            -- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            -- dashboard.button("h", "  Help window", ":top help <CR>"),
            -- dashboard.button("c", "  Configure", ":cd " .. config_dir .. " <CR>" .. ":e . <CR>"),
            -- dashboard.button("q", "󰅙  Quit Neovim", ":qa<CR>"),
        }

        local project_enabled = require("user.base.opts").project.enabled
        if project_enabled then
            table.insert(
                dashboard_entries,
                #dashboard_entries + 1,
                dashboard.button("p", "󰳏  Find project", ":Telescope projects <CR>")
            )
        end

        table.insert(
            dashboard_entries,
            #dashboard_entries + 1,
            dashboard.button("h", "  Help window", ":top help <CR>")
        )
        table.insert(
            dashboard_entries,
            #dashboard_entries + 1,
            dashboard.button("c", "  Configure", ":cd " .. config_dir .. " <CR>" .. ":e . <CR>")
        )
        table.insert(
            dashboard_entries,
            #dashboard_entries + 1,
            dashboard.button("q", "󰅙  Quit Neovim", ":qa<CR>")
        )

        dashboard.section.buttons.val = dashboard_entries

        require("alpha").setup(dashboard.config)
    end,
}
