wezterm = require('wezterm')
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.default_domain = 'WSL:archlinux'

config.max_fps = 180
config.animation_fps = 180

config.enable_tab_bar = false

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
-- Font
config.font = wezterm.font_with_fallback { 'Berkeley Mono', 'Symbols Nerd Font' }

config.font_size = 14.5
config.line_height = 1
config.freetype_load_flags = 'NO_HINTING'

-- Catppuccin
config.colors = {
    cursor_fg = "#232136",
    cursor_bg = "#dcdec9",
    cursor_border = "#242933",

    foreground = "#d8dee9",
    background = "#242933",
    selection_fg = "#d8dee9",
    selection_bg = "#2e3440",
    
    scrollbar_thumb = "#b3e1a3",
    split = "#b3e1a3",

    ansi = {"#191d24", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead" ,"#8fbcbb" ,"#d8dee9"},
    brights = {"#3b4252", "#d06f79", "#b1d196", "#f0d399", "#88c0d0", "#c895bf", "#93ccdc", "#e5e9f0"},
    
    tab_bar = {
        background = "#1e1e2e",
        active_tab = {
            bg_color = "#1E1E28",
            fg_color = "#D7DAE0"
        },
        inactive_tab = {
            bg_color = "#1B1923",
            fg_color = "#A4B9EF"
        },
        inactive_tab_hover = {
            bg_color = "#1E1E28",
            fg_color = "#D7DAE0"
        },
        new_tab = {
            bg_color = "#15121C",
            fg_color = "#6E6C7C"
        },
        new_tab_hover = {
            bg_color = "#1E1E28",
            fg_color = "#D7DAE0",
        italic = true
        }
    }
}
config.window_background_opacity = 1

return config
