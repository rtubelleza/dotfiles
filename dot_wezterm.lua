-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tab Bar Configs
config.use_fancy_tab_bar = true --curved bar thing
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "Monaspace Neon", weight = "Bold" }),
}

-- Window Padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 5,
	bottom = 5,
}

-- Image Protocol
config.enable_kitty_graphics = true

-- Window Opacity
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })

-- Custom color scheme with Catpuccin Mocha as base
local catmocha_custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
catmocha_custom.tab_bar.background = "#5E23E9"
config.color_schemes = { ["CustomCatMocha"] = catmocha_custom }
config.color_scheme = "CustomCatMocha"

-- Custom key binds
config.keys = {
	{
		toplevel = true,
		key = "RightArrow",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		toplevel = true,
		key = "DownArrow",
		mods = "SUPER|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},

	{
		key = "w",
		mods = "SUPER|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	{
		key = "UpArrow",
		mods = "SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},

	{
		key = "DownArrow",
		mods = "SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	{
		key = "RightArrow",
		mods = "SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	{
		key = "LeftArrow",
		mods = "SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
}

-- and finally, return the configuration to wezterm
return config
