-- Pull in the wezterm API ----------------------------------------------------
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices -----------------------
config.default_prog = { 'wsl', '-d', 'archlinux', '--cd', '~' }

-- Color scheme ---------------------------------------------------------------
config.color_scheme = "Catppuccin Macchiato"
-- config.window_background_opacity = 0.95

local BG = "rgba(31,31,40,0.95)"
local TAB_BAR_BG = "rgba(11,0,34,0.95)"

config.colors = {
	background = BG,
}

-- Font -----------------------------------------------------------------------
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 12.0

config.line_height = 1.0

-- Window ---------------------------------------------------------------------
config.window_padding = {
	left = 5,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_decorations = "RESIZE"

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- Tabbar ---------------------------------------------------------------------
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 30

config.colors.tab_bar = {
	background = TAB_BAR_BG,
}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_LEFT_HALF_CIRLCE = wezterm.nerdfonts.ple_left_half_circle_thick
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
local SOLID_RIGHT_HALF_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = TAB_BAR_BG
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = " " .. SOLID_LEFT_HALF_CIRLCE },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_HALF_CIRCLE },
	}
end)

-- Profiles -------------------------------------------------------------------
default_domains = {
    {
        name = 'Powershell',
        default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' },
    },
}

-- Keymaps --------------------------------------------------------------------
disable_default_key_bindings = true

config.keys = {
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = act.ShowLauncher,
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
	    key = '1',
	    mods = 'CTRL|SHIFT',
	    action = wezterm.action.SpawnCommandInNewTab {
            args = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' },
            label = 'PowerShell',
	    },
    },
}
--
-- for i = 1, 9 do
-- 	table.insert(config.keys, {
-- 		key = tostring(i),
-- 	  mods = 'CTRL',
-- 		action = wezterm.action.ActivateTab(i - 1),
-- 	})
--
-- 	if i != 1 then
-- 		table.insert(config.keys, {
-- 			key = tostring(i),
-- 		  mods = 'CTRL|SHIFT',
-- 		  action = wezterm.action.DisableDefaultAssignment,
-- 		})
-- 	else
-- 		table.insert(config.keys, {
-- 		    key = tostring(i),
-- 		    mods = 'CTRL|SHIFT',
-- 		    action = wezterm.action.SpawnCommandInNewTab {
--                 args = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' },
--                 label = 'PowerShell',
-- 			},
-- 		})
-- 	end
-- end

-- and finally, return the configuration to wezterm ---------------------------
return config
