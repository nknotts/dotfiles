-- Pull in the wezterm API
local wezterm = require("wezterm")

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.quit_when_all_windows_are_closed = false

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.window_background_opacity = 0.90

config.keys = {
	{
		key = "Space",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }),
	},
}

-- and finally, return the configuration to wezterm
return config
