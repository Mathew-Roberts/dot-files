local wezterm = require 'wezterm'
local bar = wezterm.plugin.require 'https://github.com/adriankarlen/bar.wezterm'
local M = {}

function M.setup(config)
  -- example enable spotify module
  local bar_config = {
    modules = {
      spotify = {
        enabled = false,
      },
      username = {
        enabled = true,
      },
      hostname = {
        enabled = false,
      },
      cwd = {
        enabled = true,
      },
    },
  }
  bar.apply_to_config(config, bar_config)
end

return M
