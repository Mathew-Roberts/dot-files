local wezterm = require 'wezterm'

local M = {}

M.setup = function(config)
  config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
  config.disable_default_key_bindings = true
  config.hyperlink_rules = wezterm.default_hyperlink_rules()
  config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  }
  config.keys = {
    -- Renaming tabs
    {
      key = ',',
      mods = 'LEADER',
      action = wezterm.action.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },

    -- Other
    {
      key = 'p',
      mods = 'LEADER',
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      key = 'c',
      mods = 'LEADER',
      action = wezterm.action { SpawnTab = 'CurrentPaneDomain' },
    },
    {
      key = 't',
      mods = 'LEADER',
      action = wezterm.action.ShowTabNavigator,
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action {
        SplitVertical = { domain = 'CurrentPaneDomain' },
      },
    },
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action {
        SplitHorizontal = { domain = 'CurrentPaneDomain' },
      },
    },
    {
      key = '&',
      mods = 'LEADER',
      action = wezterm.action { CloseCurrentTab = { confirm = false } },
    },
    { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = false } },
    { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },

    { key = 'Tab', mods = 'CTRL', action = wezterm.action { ActivateTabRelative = 1 } },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action { ActivateTabRelative = -1 } },

    { key = 'y', mods = 'SUPER', action = wezterm.action.ActivateCopyMode },
    { key = 'c', mods = 'SUPER', action = wezterm.action { CopyTo = 'Clipboard' } },
    { key = 'v', mods = 'SUPER', action = wezterm.action { PasteFrom = 'Clipboard' } },

    { key = 'F12', mods = '', action = wezterm.action.ToggleFullScreen },

    -- Workspaces
    {
      key = ';',
      mods = 'LEADER',
      action = wezterm.action.PromptInputLine {
        description = wezterm.format {
          { Attribute = { Intensity = 'Bold' } },
          { Foreground = { AnsiColor = 'Fuchsia' } },
          { Text = 'Enter name for new workspace' },
        },
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:perform_action(
              wezterm.action.SwitchToWorkspace {
                name = line,
              },
              pane
            )
          end
        end),
      },
    },
    {
      key = '%',
      mods = 'LEADER',
      action = wezterm.action.ShowLauncherArgs {
        flags = 'FUZZY|WORKSPACES',
      },
    },
    { key = ')', mods = 'LEADER', action = wezterm.action.SwitchWorkspaceRelative(1) },
    { key = '(', mods = 'LEADER', action = wezterm.action.SwitchWorkspaceRelative(-1) },
  }
end

return M
