-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Opacity backgroung, will be rendered by a compositor (picom)
config.window_background_opacity = 0.67

-- Disable tab bar. Can also be enabled if more than one tab
config.enable_tab_bar = false
-- hide_tab_bar_if_only_one_tab = true
--
config.enable_scroll_bar = false
config.window_padding = {
  left = 1,
  right = 1,
  top = 0,
  bottom = 0,
}
-- Theme: Tokyo Night Storm:
config.color_scheme = 'Black Metal (Venom) (base16)'

-- Run fastfetch as first
config.default_prog={"/bin/bash", "-l", "-c", "fastfetch && bash"}

-- return the configuration to wezterm
return config
