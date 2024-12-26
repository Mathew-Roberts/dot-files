local M = {}

M.setup = function(config)
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
end

return M
