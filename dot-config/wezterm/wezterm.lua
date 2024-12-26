-- Pull in the wezterm api
local wezterm = require 'wezterm'

-- Hold the configuration
local config = wezterm.config_builder()

config.font_size = 14
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
config.tab_max_width = 50
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.window_padding = {
  top = 0,
  bottom = 0,
}

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

local keys = require 'keymaps'
local move = require 'move'

keys.setup(config)
move.setup(config)

return config
