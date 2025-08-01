-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = 'LeftArrow',  mods = 'OPT',  action = act.SendString '\x1bb' },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = 'RightArrow', mods = 'OPT',  action = act.SendString '\x1bf' },
	-- panes
	{ key = 'LeftArrow',  mods = 'CMD',  action = wezterm.action.ActivatePaneDirection 'Prev' },
	{ key = 'RightArrow', mods = 'CMD',  action = wezterm.action.ActivatePaneDirection 'Next' },
	{ key = 'UpArrow',    mods = 'CMD',  action = wezterm.action.SplitPane { direction = 'Right'}, },
	{ key = 'DownArrow',  mods = 'CMD',  action = wezterm.action.CloseCurrentPane { confirm = true } },
}

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.color_scheme = 'Macchiato'
config.font_size = 20
config.tab_max_width = 160

config.window_decorations = "RESIZE"
config.window_frame = {
	font_size = 20.0
}
-- translucent window effect
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local pane_info = tab_info.active_pane
	local pane = wezterm.mux.get_pane(pane_info.pane_id)
	local proc_info = pane:get_foreground_process_info()

	local cmdline = proc_info and proc_info.argv or {}
	local title

	if #cmdline > 1 then
		-- Join full command and args
		title = table.concat(cmdline, " ")
	else
		return pane_info.title
	end

	return title
end

wezterm.on(
	'format-tab-title',
	function(tab, tabs, panes, config, hover, max_width)
		local title = tab_title(tab)
		return title
	end
)

-- Finally, return the configuration to wezterm:
return config
