-- Pull in the wezterm api
local wezterm = require("wezterm")

-- Hold the configuration
local config = wezterm.config_builder()

config.font_size = 14
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

return config
