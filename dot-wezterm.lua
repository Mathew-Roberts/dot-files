-- Pull in the wezterm api
local wezterm = require("wezterm")

-- Hold the configuration
local config = wezterm.config_builder()

config.font_size = 14
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.tab_max_width = 50
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.window_padding = {
	top = 0,
	bottom = 0,
}

local act = wezterm.action

local keys = {
	-- Splitting into panes
	{
		key = "-",
		mods = "ALT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "|",
		mods = "ALT|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Delete pane
	{ key = "d", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	-- Create new window
	{ key = "n", mods = "ALT|SHIFT", action = act.SpawnWindow },

	-- Temporarily zoom into a pane
	{ key = "z", mods = "ALT", action = act.TogglePaneZoomState },

	-- Creating new tabs
	{
		key = "t",
		mods = "ALT|SHIFT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	-- Showing Tab navigator
	{ key = "s", mods = "ALT|SHIFT", action = wezterm.action.ShowTabNavigator },

	-- Navigate thorugh panes like in neovim
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},

	-- Cycle through tabs
	{ key = "Tab", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "ALT|SHIFT", action = act.ActivateTabRelative(-1) },

	-- Resize panes
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },

	-- Renaming tabs
	{
		key = "r",
		mods = "ALT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.keys = keys

return config
