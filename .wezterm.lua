local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {
  font = wezterm.font 'Fira Code',
  color_scheme = 'Snazzy' ,
  font_size = 12,
  enable_kitty_keyboard = true,
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = "RESIZE"
}
