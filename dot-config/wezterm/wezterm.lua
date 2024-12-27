-- Pull in the wezterm api
local wezterm = require 'wezterm'

-- Hold the configuration
local config = wezterm.config_builder()

local opts = require 'lua.opts'
local keys = require 'lua.keymaps'
local move = require 'lua.plugins.move'
local bar = require 'lua.plugins.bar'

opts.setup(config)
keys.setup(config)
move.setup(config)
bar.setup(config)

return config
