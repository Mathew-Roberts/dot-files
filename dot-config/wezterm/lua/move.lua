local wezterm = require 'wezterm'

local M = {}

function M.setup(config)
  local function is_vim(pane)
    local process_info = pane:get_foreground_process_info()
    local process_name = process_info and process_info.name
    return process_name == 'nvim' or process_name == 'vim'
  end

  local mod_key = 'CTRL'

  local direction_keys = {
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
  }

  local function split_nav(key)
    return {
      key = key,
      mods = mod_key,
      action = wezterm.action_callback(function(win, pane)
        if is_vim(pane) then
          win:perform_action({
            SendKey = { key = key, mods = mod_key },
          }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end),
    }
  end

  local nav_keys = {
    split_nav 'h',
    split_nav 'j',
    split_nav 'k',
    split_nav 'l',
  }
  -- Append new keys to config.keys
  for _, key_mapping in ipairs(nav_keys) do
    table.insert(config.keys, key_mapping)
  end
end

return M
