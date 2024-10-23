local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_prog = { "/bin/zsh", "--login", "-c", "tmux a -t tmux || tmux new -s tmux" }

config.color_scheme = "GruvboxDarkHard"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.native_macos_fullscreen_mode = false
config.initial_cols = 90
config.initial_rows = 30
config.scrollback_lines = 9999

config.treat_left_ctrlalt_as_altgr = true

config.font = wezterm.font("SauceCodePro Nerd Font")
config.font_size = 18

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
config.window_close_confirmation = "NeverPrompt"

config.hide_mouse_cursor_when_typing = true

return config
