local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {
  keys = {
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
        -- Switch to the default workspace
    {
      key = 'y',
      mods = 'CTRL|SHIFT',
      action = act.SwitchToWorkspace {
        name = 'default',
      },
    },
    -- Switch to a monitoring workspace, which will have `top` launched into it
    {
      key = 'u',
      mods = 'CTRL|SHIFT',
      action = act.SwitchToWorkspace {
        name = 'monitoring',
        spawn = {
          args = { 'top' },
        },
      },
    },
    -- Create a new workspace with a random name and switch to it
    { key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace },
    -- Show the launcher in fuzzy selection mode and have it list all workspaces
    -- and allow activating one.
    {
      key = '9',
      mods = 'ALT',
      action = act.ShowLauncherArgs {
        flags = 'FUZZY|WORKSPACES',
      },
    },

    -- This will create a new split and run the `top` program inside it
    {
      key = '|',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '\\',
      mods = 'CTRL',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'e',
      mods = 'CTRL|SHIFT',
       action=wezterm.action{QuickSelectArgs={
       patterns={
          "https?://\\S+"
       },
       action = wezterm.action_callback(function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info("opening: " .. url)
          wezterm.open_with(url)
       end)
     }}
    },
  },

  
  font = wezterm.font 'Fira Code',
  color_scheme = 'Catppuccin Mocha' ,
  font_size = 13,
  enable_kitty_keyboard = true,
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = "RESIZE"
}
