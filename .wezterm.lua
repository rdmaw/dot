local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.wsl_domains = {
    {
      name = 'WSL:Ubuntu',
      distribution = 'Ubuntu',
    },
}
config.default_prog = { "ubuntu.exe" }

config.keys = {
    {
        key = "v",
        mods = "CTRL",
        action = wezterm.action.PasteFrom "Clipboard",
    },
}

config.enable_tab_bar = false

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.color_scheme = "rose-pine-moon"

-- Font
config.font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Regular"})
config.font_size = 18
config.line_height = 0.8
config.freetype_load_flags = 'NO_HINTING'
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

-- Cursor
config.default_cursor_style = "SteadyBlock"
config.colors = {
    cursor_fg = "#232136",
    cursor_bg = "#dcdec9",
    cursor_border = "#dcdec9",
    selection_fg = "rgba(0, 0, 0, 0)",
    selection_bg = "rgba(68, 65, 90, 0.75)",
}

-- Background
config.window_background_image = "c:/users/user/pathtofolder/image.jpg"
config.window_background_image_hsb = {
    brightness = 0.14,
}
config.window_background_opacity = 1

return config