-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_background_opacity = 0.5
config.enable_tab_bar = false
-- hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Storm (Gogh)'
config.enable_scroll_bar = false
config.window_padding = {
  left = 1,
  right = 1,
  top = 0,
  bottom = 0,
}
-- and finally, return the configuration to wezterm
return config
