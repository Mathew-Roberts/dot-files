-- Pull in the wezterm api
local wezterm = require("wezterm")

-- Hold the configuration
local config = wezterm.config_builder()
config.font_size = 14

return config
