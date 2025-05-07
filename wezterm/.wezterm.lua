local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.wsl_domains = {
    {
      name = 'WSL:Arch',
      distribution = 'archlinux',
      default_cwd = "~",
    },
}
config.default_domain = "WSL:Arch"

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
    top = 3,
    bottom = 0,
}
-- Font
config.font = wezterm.font_with_fallback{
    {family = "Berkeley Mono", weight = "Regular"},
    {family = "Symbols Nerd Font", weight = "Regular"},
}

config.font_size = 15
config.line_height = 1
config.freetype_load_flags = "NO_HINTING"

-- Cursor
config.default_cursor_style = "SteadyBlock"

-- Catppuccin
config.colors = {
    cursor_fg = "#232136",
    cursor_bg = "#dcdec9",
    cursor_border = "#1e1e2e",

    background = "#1d2021",
    foreground = "#D7DAE0",
    
    selection_bg = "#2D293B",
    selection_fg = "#F0AFE1",
    
    scrollbar_thumb = "#B3E1A3",
    split = "#B3E1A3",

    ansi = {"#2E3440", "#BF616A", "#A3BE8C", "#EBCB8B", "#5E81AC", "#B48EAD" ,"#81A1C1" ,"#D8DEE9"},
    brights = {"#3B4252", "#BF616A", "#A3BE8C", "#EBCB8B", "#5E81AC", "#B48EAD", "#88C0D0", "#ECEFF4"},
    
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
