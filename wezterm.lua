local wezterm = require 'wezterm'

local mux = wezterm.mux
local act = wezterm.action
local config = {}

config.color_scheme = 'Dracula'
config.tab_bar_at_bottom = true

config.window_background_opacity = 0.98

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

wezterm.on('update-right-status', function(window, pane)
    window:set_left_status(window:active_workspace())
end)

config.keys = {
    -- Switch to the pane on the left
    { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left"), },
    -- Switch to the pane below
    { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down"), },
    -- Switch to the pane above
    { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up"), },
    -- Switch to the pane on the right
    { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right"), },
    -- Switch to the default workspace
    {
        key = '!',
        mods = 'CTRL|SHIFT',
        action = act.SwitchToWorkspace {
            name = 'default',
        },
    },
    -- Switch to a monitoring workspace, which will have `htop` launched into it
    {
        key = '@',
        mods = 'CTRL|SHIFT',
        action = act.SwitchToWorkspace {
            name = 'monitoring',
            spawn = {
                args = { 'htop' }
            }
        },
    },

    -- Split horizontally (Side-by-side)
    {
        key = '%',
        mods = 'CTRL|SHIFT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- Split vertically (Top-and-bottom)
    {
        key = '"',
        mods = 'CTRL|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Alternatively, using Alt+Shift
    -- { key = 'h', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    -- { key = 'v', mods = 'ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    -- Activate tab by index (0-indexed, 1 is first tab)
    { key = '1', mods = 'CTRL', action = act.ActivateTab(0) },
    { key = '2', mods = 'CTRL', action = act.ActivateTab(1) },
    { key = '3', mods = 'CTRL', action = act.ActivateTab(2) },
    { key = '4', mods = 'CTRL', action = act.ActivateTab(3) },
    { key = '5', mods = 'CTRL', action = act.ActivateTab(4) },
    { key = '6', mods = 'CTRL', action = act.ActivateTab(5) },
    -- Close current pane
    {
        key = 'w',
        mods = 'CTRL',
        action = act.CloseCurrentPane { confirm = true },
    },
}

return config
