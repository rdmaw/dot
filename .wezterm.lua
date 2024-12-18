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

config.max_fps = 240
config.animation_fps = 240

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

-- Font
config.font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Regular"})
config.font_size = 18
config.line_height = 0.8
config.freetype_load_flags = 'NO_HINTING'
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

-- Cursor
config.default_cursor_style = "SteadyBlock"

    -- Catppuccin
config.colors = {
    
    cursor_fg = "#232136",
    cursor_bg = "#dcdec9",
    cursor_border = "#1e1e2e",

    background = "#1e1e2e",
    foreground = "#D7DAE0",
    
    selection_bg = "#2D293B",
    selection_fg = "#F0AFE1",
    
    scrollbar_thumb = "#B3E1A3",
    split = "#B3E1A3",
    
    ansi = {"#6E6C7C", "#E28C8C", "#B3E1A3", "#EADDA0", "#A4B9EF", "#C6AAE8" ,"#F0AFE1" ,"#D7DAE0"},
    brights = {"#6E6C7C", "#E28C8C", "#B3E1A3", "#EADDA0", "#A4B9EF", "#C6AAE8", "#F0AFE1", "#D7DAE0"},
    
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

-- Background
-- config.window_background_image = "C:/Users/janan/Desktop/Bilder/terminal/christmastree.jpg"
-- config.window_background_image_hsb = {
--     brightness = 0.14,
-- }
config.window_background_opacity = 0.95

return config