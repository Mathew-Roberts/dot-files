-- Pull in the wezterm api
local wezterm = require 'wezterm'

-- Hold the configuration
local config = wezterm.config_builder()

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

local opts = require 'lua.opts'
local keys = require 'lua.keymaps'
local move = require 'lua.move'

opts.setup(config)
keys.setup(config)
move.setup(config)

return config